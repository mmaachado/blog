import sys
from PIL import Image, ImageOps

INK = (242, 230, 207)
THRESHOLD = 18

def to_transparent(src: str, dst: str) -> None:
    img = Image.open(src).convert("L")
    img = ImageOps.autocontrast(img)
    alpha = img.point(lambda v: 0 if v < THRESHOLD else v)
    out = Image.new("RGBA", img.size, INK + (0,))
    out.putalpha(alpha)
    out.save(dst, "PNG", optimize=True)

if __name__ == "__main__":
    to_transparent(sys.argv[1], sys.argv[2])
