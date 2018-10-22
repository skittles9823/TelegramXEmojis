from PIL import Image
from PIL import ImageFilter
from PIL import ImageEnhance
from PIL.ImageFilter import BuiltinFilter
import random

# Help I didnt even read the docs on the filter format, this is literally just random values
class WHAT_AM_I_DOING(BuiltinFilter):
    name = "god stop me please"
    filterargs = (5, 5), 250, 0, (
        1,  10,  5,  6,  1, 
        1,  5, 50,  55,  1, 
        1,  1,  69,  1,  0, 
        1,  3,  1,  1,  1, 
        6,  30,  30,  5,  20, 
        )

def abominate(image: Image):
    image = image.convert('RGBA')
    image = image.filter(ImageFilter.EDGE_ENHANCE_MORE)
    image = image.filter(ImageFilter.EDGE_ENHANCE_MORE)
    image = image.filter(ImageFilter.SMOOTH_MORE)
    image = image.filter(ImageFilter.DETAIL)
    image = image.filter(WHAT_AM_I_DOING)
    image = ImageEnhance.Color(image).enhance(2)
    image = ImageEnhance.Contrast(image).enhance(2)
    image = ImageEnhance.Sharpness(image).enhance(1.5)
    image = image.rotate(random.randint(-30, 30))
    return image
        
    