from trainer.unlearn.base import UnlearnTrainer

class AlphaEdit(UnlearnTrainer):
    def __init__(self, beta=1.0, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def train(self, *args, **kwargs):
        # self.model is my model
        # self.train_dataset

        pass
