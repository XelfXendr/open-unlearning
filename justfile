
setup: create-env download-data

create-env:
    #!/bin/bash
    uv sync

download-data:
    #!/bin/bash
    uv run setup_data.py --eval_logs

example-eval:
    #!/bin/bash
    HF_TOKEN=$(cat hf_token.txt)
    uv run src/train.py --config-name=unlearn.yaml experiment=unlearn/tofu/default \
        forget_split=forget10 retain_split=retain90 \
        trainer=GradAscent task_name=SAMPLE_UNLEARN
