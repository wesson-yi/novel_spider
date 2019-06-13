# API文档

### 获取书目


GET api/books

```ruby
[{
  ywid: 100,
  name: 'book-one-name',
  latest_chapter: {
    ywid: 1000,
    name: 'chapter-name-one'
  }
}, {
  ywid: 200,
  name: 'book-two-name'
  latest_chapter: {
    ywid: 2000,
    name: 'chapter-name-two'
  }
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
    name: 'chapter1001-name'
    }, {
    ywid: 1002,
    name: 'chapter1002-name'
  }]
}
```
< 201
