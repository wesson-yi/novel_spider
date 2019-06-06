# API文档

### 获取书目


GET api/books

```ruby
[{
  ywid: 100,
  latest_chapter_ywid: 1000
}, {
  ywid: 200,
  latest_chapter_ywid: 2000
}]
```
< 200

### 创建书目章节

POST api/chapters

```ruby
{
  book_ywid: 100,
  chapters: [{
		ywid: 1001,
		name: 'chapter1001 name'
  	}, {
  	ywid: 1002,
 		name: 'chapter1002 name'
 	  }]
}
```
< 201
