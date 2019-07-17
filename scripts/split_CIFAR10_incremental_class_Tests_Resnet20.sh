#!/usr/bin/env bash
GPUID=0
OUTDIR=outputs/split_CIFAR10_incremental_class_Test_ResNet_20_4
REPEAT=1
mkdir -p $OUTDIR
/usr/bin/python3.5 -u /home/amir/PycharmProjects/Continual-Learning-Benchmark/iBatchLearn.py --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer SGD --momentum 0.9 --weight_decay 5e-4 --force_out_dim 10 --no_class_remap --first_split_size 10 --other_split_size 0 --schedule 150 250 350 --batch_size 128 --model_name ResNet18 --model_type resnet --lr 0.1 --dataset CIFAR10 --offline_training | tee ${OUTDIR}/Offline0.log
/usr/bin/python3.5 -u /home/amir/PycharmProjects/Continual-Learning-Benchmark/iBatchLearn.py --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer SGD --momentum 0.9 --weight_decay 5e-4 --force_out_dim 10 --no_class_remap --first_split_size 10 --other_split_size 0 --schedule 150 250 350 --batch_size 128 --model_name ResNet18 --model_type resnet --lr 0.01 --dataset CIFAR10 --offline_training | tee ${OUTDIR}/Offline1.log


