#!/usr/bin/env bash
GPUID=1
OUTDIR=outputs/split_MNIST_ResNet_18_July5th_AllResults
REPEAT=1
mkdir -p $OUTDIR
/usr/bin/python3.5 -u /home/amir/PycharmProjects/Continual-Learning-Benchmark/iBatchLearn.py --gpuid $GPUID --repeat $REPEAT --optimizer SGD --momentum 0.9 --weight_decay 5e-4 --force_out_dim 10 --no_class_remap --first_split_size 10 --other_split_size 0 --schedule 100 150 250 --batch_size 128 --model_name ResNet18 --model_type resnet --lr 0.1 --dataset CIFAR10 --offline_training | tee ${OUTDIR}/Offline.log
/usr/bin/python3.5 -u /home/amir/PycharmProjects/Continual-Learning-Benchmark/iBatchLearn.py --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer SGD --momentum 0.9 --weight_decay 5e-4 --force_out_dim 10 --no_class_remap --first_split_size 2 --other_split_size 2 --schedule 50 100 150 --batch_size 128 --model_name ResNet18 --model_type resnet --lr 0.1 --dataset CIFAR10 | tee ${OUTDIR}/SGD.log
/usr/bin/python3.5 -u /home/amir/PycharmProjects/Continual-Learning-Benchmark/iBatchLearn.py --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer SGD --momentum 0.9 --weight_decay 5e-4 --force_out_dim 10 --no_class_remap --first_split_size 2 --other_split_size 2 --schedule 50 100 150 --batch_size 128 --model_name ResNet18 --model_type resnet --lr 0.1 --agent_type regularization --agent_name MAS --reg_coef 1 --dataset CIFAR10 | tee ${OUTDIR}/MAS.log
/usr/bin/python3.5 -u /home/amir/PycharmProjects/Continual-Learning-Benchmark/iBatchLearn.py --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer SGD --momentum 0.9 --weight_decay 5e-4 --force_out_dim 10 --no_class_remap --first_split_size 2 --other_split_size 2 --schedule 50 100 150 --batch_size 128 --model_name ResNet18 --model_type resnet --lr 0.1 --agent_type customization --agent_name EWC_reset_optim  --reg_coef 600 --dataset CIFAR10 | tee ${OUTDIR}/EWC.log
/usr/bin/python3.5 -u /home/amir/PycharmProjects/Continual-Learning-Benchmark/iBatchLearn.py --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer SGD --momentum 0.9 --weight_decay 5e-4 --force_out_dim 10 --no_class_remap --first_split_size 2 --other_split_size 2 --schedule 50 100 150 --batch_size 128 --model_name ResNet18 --model_type resnet --lr 0.1 --agent_type customization --agent_name EWC_rand_init --reg_coef 600 --dataset CIFAR10 | tee ${OUTDIR}/EWC_Rand_Init.log

