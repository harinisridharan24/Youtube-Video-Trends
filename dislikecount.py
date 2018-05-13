#Finding out how many videos has more number of dislikes than likes
import pandas as pd
youtube_data = pd.read_csv("cleaned_US_data.csv", index_col= "video_id")
youtube_data['likes'].fillna(youtube_data['likes'].mean())
youtube_data['dislikes'].fillna(youtube_data['dislikes'].mean())
youtube_data['views'].fillna(youtube_data['views'].mean())
youtube_data['comment_count'].fillna(youtube_data['comment_count'].mean())

#12 Youtube videos accumulates equal number of likes and dislikes
condition = youtube_data[youtube_data['dislikes'] == youtube_data['likes']]
print(condition)

#509 Youtube videos accumulated more dislikes than likes
condition1 = youtube_data[youtube_data['dislikes'] > youtube_data['likes']]
print(condition1)

#none of the videos has more likes than views
condition2 = youtube_data[youtube_data['likes'] >= youtube_data['views']]
print(condition2)