"""Ensure the fallback auditor preserves correctness-relevant LLVM details."""
import pathlib
import tempfile
import unittest

from compare_two_column_llvm import compare


FIXTURE = '''
source_filename = "/tmp/input.cpp"
target triple = "amdgcn-amd-amdhsa"
define amdgpu_kernel void @"entry"(ptr %p) #0 {
start:
  br label %loop
loop:
  %x = load float, ptr %p, align 4, !noalias !0
  %y = fadd float %x, 1.000000e+00
  store float %y, ptr %p, align 4
  br label %exit, !llvm.loop !3
exit:
  ret void
}
attributes #0 = { nounwind "amdgpu-flat-work-group-size"="128,128" }
!llvm.module.flags = !{!5}
!hipsycl.sscp.annotations = !{!6}
!0 = !{!1}
!1 = distinct !{!1, !2, !"a; domain"}
!2 = distinct !{!2, !"alias"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.unroll.disable"}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = distinct !{ptr undef, !"hipsycl_kernel_dimension", i32 3}
'''


class LLVMComparisonTest(unittest.TestCase):
    def check(self, left, right):
        with tempfile.TemporaryDirectory() as directory:
            a, b = pathlib.Path(directory)/'a.ll', pathlib.Path(directory)/'b.ll'
            a.write_text(left)
            b.write_text(right)
            return compare(a, b)['equal']

    def test_bijective_renaming_and_dead_annotation(self):
        other = FIXTURE.replace('@"entry"', '@other').replace('%p', '%input')
        for old, new in (('start','bb0'),('loop','bb1'),('exit','bb2')):
            other = other.replace(f'{old}:', f'{new}:').replace(f'%{old}', f'%{new}')
        other = other.replace('%x', '%123').replace('%y', '%456').replace('#0', '#9')
        # Reorder numeric graph IDs without changing sharing or self-cycles.
        import re
        other = re.sub(r'!(\d+)', lambda m: '!'+str(100+int(m[1])), other)
        other = other.replace('!{!106}', '!{!106, !107}') + (
            '!107 = distinct !{null, !"hipsycl_kernel_dimension", i32 3}\n')
        self.assertTrue(self.check(FIXTURE, other))

    def test_semantic_changes_remain_visible(self):
        changes = [
            ('fadd float', 'fsub float'), ('fadd float', 'fadd fast float'),
            ('align 4', 'align 2'), ('1.000000e+00', '2.000000e+00'),
            ('i32 4}', 'i32 8}'), ('128,128', '256,256'),
            ('!"alias"', '!"different alias"'), ('!0 = !{!1}', '!0 = !{!2}'),
            ('llvm.loop.unroll.disable', 'llvm.loop.unroll.enable'),
            ('!"a; domain"', '!"a; different domain"')]
        for old, new in changes:
            with self.subTest(old=old):
                self.assertIn(old, FIXTURE)
                self.assertFalse(self.check(FIXTURE, FIXTURE.replace(old, new)))

    def test_live_annotation_cannot_be_excluded(self):
        with self.assertRaises(AssertionError):
            self.check(FIXTURE, FIXTURE.replace('!noalias !0', '!noalias !6'))

    def test_instruction_on_label_is_not_silently_removed(self):
        with self.assertRaises(AssertionError):
            self.check(FIXTURE, FIXTURE.replace('exit:', 'exit: ret void'))


if __name__ == '__main__':
    unittest.main()
