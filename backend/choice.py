from enum import Enum,EnumMeta

class ChoiceEnumMeta(EnumMeta):
    def __iter__(self):
        return ((tag.name,tag.value) for tag in super().__iter__())


class ChoiceEnum(Enum,metaclass = ChoiceEnumMeta):
    pass

class like_choice(ChoiceEnum):
    like = "1"
    unlike = "0"

class collect_choice(ChoiceEnum):
    collect = "1"
    un_collect = "0"

class follow_choice(ChoiceEnum):
    follow = "1"
    un_follow = "0"

class gender_choice(ChoiceEnum):
    boy = "1"
    girl = "0"