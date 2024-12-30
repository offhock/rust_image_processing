#!/bin/bash

run() {  # $2: [ n | m | s | l ] $3: image file $1: task [detect | classify | pose | segment | obb]
    # 유효한 값인지 확인
    if [[ "$2" != "n" && "$2" != "m" && "$2" != "s" && "$2" != "l" ]]; then
        echo "Error: Invalid scale value '$2'. Allowed values are n, m, s, l."
        exit 1
    fi

    # 파일 존재 여부 확인
    if [[ ! -f "assets/$3" ]]; then
        echo "Error: File 'assets/$3' does not exist."
        exit 1
    fi

    # task에 따른 모델 파일 설정
    case "$1" in
        detect|det)
            task="detect"
            model="v11-$2-det.onnx"
            ;;
        classify|cls)
            task="classify"
            model="v11-$2-cls.onnx"
            ;;
        pose)
            task="pose"
            model="v11-$2-pose.onnx"
            ;;
        segment|seg)
            task="segment"
            model="v11-$2-seg.onnx"
            ;;
        obb)
            task="obb"        
            model="v11-$2-obb.onnx"
            ;;
        *)
            echo "Error: Invalid task value '$1'. Allowed values are detect, classify, pose, segment, obb."
            exit 1
            ;;
    esac

    if ! cargo run -r -- --task "$task" --ver v11 --scale $2 --model models/$model --view --source assets/$3 $4 $5; then
        echo "Error: Command failed on attempt $i"
        exit 1
    fi

}

# Usage: rust_image_processing <--model <MODEL>|--source <SOURCE>|--task <TASK>|--ver <VER>|--scale <SCALE>|--batch-size <BATCH_SIZE>|--width-min <WIDTH_MIN>|--width <WIDTH>|--width-max <WIDTH_MAX>|--height-min <HEIGHT_MIN>|--height <HEIGHT>|--height-max <HEIGHT_MAX>|--nc <NC>|--confs <CONFS>|--trt|--cuda|--coreml|--half|--device-id <DEVICE_ID>|--profile|--no-contours|--view|--nosave>
# cargo run -r -- --task detect --ver v11 --scale n --model models/v11-n-det.onnx --view --nosave --source assets/driving.mp4  
# cargo run -r -- --task detect --ver v11 --scale n --model models/v11-n-det.onnx --view --source https://www.youtube.com/watch?v=cG95GwuK-as

# 예시 실행
# ./run.sh det n driving.mp4 --nosave
# ./run.sh cls n driving.mp4 --nosave
# ./run.sh pose n driving.mp4 --nosave
# ./run.sh seg n driving.mp4 --nosave
# ./run.sh obb n bus.jpg 

run det n driving.mp4 --nosave

# run $1 $2 $3 $4 $5

