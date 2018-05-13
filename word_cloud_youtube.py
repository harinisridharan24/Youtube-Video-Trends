import sys
import io
import string
from os import path
import matplotlib.pyplot as plt
from wordcloud import WordCloud, STOPWORDS,ImageColorGenerator
import numpy as np
from PIL import Image

d = d = path.dirname(__file__)
text = io.open(path.join(d, 'channel_title.txt')).read()

# youtube_mask = np.array(Image.open(path.join(d, "mask.png")))

youtube_coloring = np.array(Image.open(path.join(d, "youtube_jpeg.png")))


STOPWORDS.add('channel')
STOPWORDS.add('title')

# STOPWORDS.add('music')
# STOPWORDS.add('talk')
# STOPWORDS.add('show')
# STOPWORDS.add('official')
# STOPWORDS.add('video')
# STOPWORDS.add('teaser')
# STOPWORDS.add('videos')
# STOPWORDS.add('tutorial')
# STOPWORDS.add('joke')
# STOPWORDS.add('star')
# STOPWORDS.add('Voice')
# STOPWORDS.add('movie')
# STOPWORDS.add('trailer')
# STOPWORDS.add('Late')


wordcloud = WordCloud(font_path="LeagueGothic-Regular.otf",mask=youtube_coloring,stopwords=STOPWORDS,background_color='White',max_font_size=40)
wordcloud.generate(text)

image_colors = ImageColorGenerator(youtube_coloring)

wordcloud.to_file(path.join(d, "youtube_colored.png"))

plt.imshow(wordcloud, interpolation="bilinear")
plt.axis("off")
plt.figure()
# recolor wordcloud and show
# we could also give color_func=image_colors directly in the constructor
plt.imshow(wordcloud.recolor(color_func=image_colors), interpolation="bilinear")
plt.axis("off")
plt.figure()
plt.imshow(youtube_coloring, cmap=plt.cm.gray, interpolation="bilinear")
plt.axis("off")
plt.show()

# plt.imshow(wordcloud, interpolation="bilinear")
# plt.axis("off")
# plt.figure()
# plt.imshow(youtube_mask, cmap=plt.cm.gray, interpolation="bilinear")
# plt.axis("off")
# plt.show()


