set tempdir := "/tmp"

export TROJA_DIR := env('HOME') + "/personal_work_troja"
export TRITON_CACHE_DIR := env('HOME') + "/personal_work_troja/.cache/triton"
export HF_HOME := env('HOME') + "/personal_work_troja/.cache/huggingface"

export HF_TOKEN := shell('cat $1', justfile_directory() + '/hf_token.txt')

setup: create-env download-data

create-env:
    #!/bin/bash
    uv sync

download-data:
    #!/bin/bash
    uv run setup_data.py --eval_logs --idk --wmdp

example-eval:
    #!/bin/bash
    uv run src/train.py --config-name=unlearn.yaml experiment=unlearn/tofu/default \
        forget_split=forget10 retain_split=retain90 \
        trainer=GradAscent task_name=SAMPLE_UNLEARN

test-vals:
    #!/bin/bash
    echo $HF_TOKEN
    echo $TROJA_DIR
    echo $TRITON_CACHE_DIR
    echo $HF_HOME
