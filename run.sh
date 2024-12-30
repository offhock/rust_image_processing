#!/bin/bash
cargo run -r -- --task pose --ver v11 --scale n --model models/v11-n-pose.onnx  --source assets/bus.jpg
cargo run -r -- --task pose --ver v11 --scale n --model models/v11-m-pose.onnx  --source assets/bus.jpg
cargo run -r -- --task pose --ver v11 --scale n --model models/v11-s-pose.onnx  --source assets/bus.jpg
cargo run -r -- --task pose --ver v11 --scale n --model models/v11-l-pose.onnx  --source assets/bus.jpg