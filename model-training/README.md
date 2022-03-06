# Model training using PyTorch's object detection API

Given that this project primarily uses scripts, it's helpful to have an idea of the directory structure.

```
.
├── output
├── annotations
├── external
│   ├── labelImg
│   │   ├── build-tools
│   │   ├── data
│   │   ├── demo
│   │   ├── libs
│   │   ├── readme
│   │   ├── requirements
│   │   ├── resources
│   │   ├── tests
│   │   └── tools
│   └── models
│       ├── community
│       ├── official
│       ├── orbit
│       └── research
├── models
│   ├── exported
│   ├── training
│   └── pretrained
├── records
├── resources
│   └── images
│       ├── test
│       └── train
└── scripts
```

Now that that's out of the way, dig into the project notebooks which are self-documenting.

1.  [train.ipynb](./train.ipynb)
2.  [export.ipynb](./export.ipynb)
