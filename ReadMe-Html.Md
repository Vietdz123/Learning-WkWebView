# HTML

# I. Các thuật ngữ cơ bản:

1. Element

Một `Element` gồm 1 thẻ mở, nội dung bên trong nó và 1 thẻ đóng:

```html
VD: <h5>Fucking</h5>
- <p>Đây là thẻ đoạn văn: Paragraph</p> 
- <br>: Xuống dòng
- <hr>: Thẻ chia các đoạn, tạo ra đường nằm ngang để chia văn bản.
- <b>Giúp in đậm(bold)</b>
- <b>Giúp in nghiêng(italic)</b>
...
```


![](Images/html/text_normal.png)

2. HyperLink

Ta có thể thêm siêu liên kết vào văn bản, text hay nút bấm. Khi ta bấm vào text thì ta có thể đẩy sang 1 trang mới.

VD1:
```html
<a href="https://www.google.com.vn/" target = "_blank"> Bấm để vào Google </a>
```


Với `target = "_blank"` thì khi tích vào label sẽ bật Google trong tap mới, còn với `target = "_self_"` thì sẽ mở trực tiếp Google trong Tap hiện tại.

Ta có thể navigate vào trang html khác như sau:

```html
</body> <a href="page2.html" target = "_blank"> Bấm để vào Page2 </a>
```

3. Thẻ image và audio và video

- Thẻ `images`:

```html
<img src="Images/html/text_normal.png" height="300px" title="Người mẫu">
```

Attribute title được sử dụng khi ta muốn di chuột vào ảnh thì hiện chữ "Người mẫu"


- Thẻ `Audios`

<audio loop autoplay muted controls src="Audios/sample-15s.mp3"></audio>

- `loop` cho phép khi kết thúc audio sẽ bật lại, `autoplay` cho phép vừa vào chạy luôn, `muted` cho phép vừa vào mute luôn, còn `controls` sẽ show ra miniControl play.

- Thẻ `Video`

<video width="300px" controls src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4">