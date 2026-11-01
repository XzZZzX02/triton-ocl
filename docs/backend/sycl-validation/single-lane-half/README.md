Validation archive for the runtime single-work-item IEEE binary16 copy repair.

The before/ directory preserves the independent 20-record diagnostic, including two MISMATCH outcomes. Baseline cost variants omit the known-broken local=1 launch and must pass every timed local=64 result; repaired variants also check local=1. Generated source, native logs and scheduler output retain original whitespace to preserve SHA-256 evidence. analyze_single_lane_half.py validates complete sets rather than inferring success from process exits.
