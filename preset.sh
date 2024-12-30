#!/bin/bash

# 기본 URL
base_url="https://github.com/jamjamjon/assets/releases/download/yolo/"

# 파일 목록
files=(
    "v11-l-cls.onnx"
    "v11-l-det.onnx"
    "v11-l-obb.onnx"
    "v11-l-pose.onnx"
    "v11-l-seg.onnx"
    "v11-m-cls.onnx"
    "v11-m-det.onnx"
    "v11-m-obb.onnx"
    "v11-m-pose.onnx"
    "v11-m-seg.onnx"
    "v11-n-cls.onnx"
    "v11-n-det.onnx"
    "v11-n-obb.onnx"
    "v11-n-pose.onnx"
    "v11-n-seg.onnx"
    "v11-s-cls.onnx"
    "v11-s-det.onnx"
    "v11-s-obb.onnx"
    "v11-s-pose.onnx"
    "v11-s-seg.onnx"
)

# 다운로드 디렉토리
download_dir="./models"
mkdir -p $download_dir

# 파일 다운로드
for file in "${files[@]}"; do
    curl -L -o $download_dir/$file ${base_url}$file
done

echo "다운로드 완료!"
