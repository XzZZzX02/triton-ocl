Rejected experiment archive. Production integration has been removed.

The measured-source/ tree and experiment.patch preserve the candidate compiler and device runners. Apply the patch to baseline 127ec096 and rebuild to reproduce the experiment; the runners are historical and require that overlay. analyze_local_copy_experiment.py is read-only and works without applying it. Incomplete and failed baseline evidence is retained and excluded from successful timing groups. Generated source and scheduler logs preserve original bytes and whitespace for fingerprint verification.
