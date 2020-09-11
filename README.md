
```
git clone
```


# 起動方法

- 一方のターミナルで srvを起動 3001ポートで railsが起動する http://localhost:3001/arts 

```
cd srv
docker-compose build
docker-compose up
```

- 他方のターミナルで herを起動

```
cd her
docker-compose build
docker-comose run api rails console
```

- herの方で ArtモデルとしてAPIがラッピングされている

```
Art.find(1)
```

- 結果

```
irb(main):004:0> Art.create(title: "5",text: "e")
=> #<Art(arts) title="5" text="e" data={"id"=>5, "title"=>"5", "text"=>"e", "created_at"=>"2020-09-08T10:42:16.195Z", "updated_at"=>"2020-09-08T10:42:16.195Z"} status="OK">
irb(main):005:0> Art.all
=> #<Her::Model::Relation:0x0000555890622418 @parent=Art, @params={}, @_fetch=nil>
irb(main):006:0> Art.all.map{|i|i}
=> [#<Art(arts/1) title="1" text="1" created_at="2020-09-07T11:36:33.703Z" updated_at="2020-09-07T11:36:33.703Z" id=1>, #<Art(arts/2) title="2" text="2" created_at="2020-09-07T11:38:01.696Z" updated_at="2020-09-07T11:38:01.696Z" id=2>, #<Art(arts/3) title="4" text="4" created_at="2020-09-07T22:03:58.881Z" updated_at="2020-09-07T22:03:58.881Z" id=3>, #<Art(arts/4) title="4" text="4" created_at="2020-09-07T22:05:11.725Z" updated_at="2020-09-07T22:05:11.725Z" id=4>, #<Art(arts/5) title="5" text="e" created_at="2020-09-08T10:42:16.195Z" updated_at="2020-09-08T10:42:16.195Z" id=5>]
```

- dockerをまたがるため localhostが使えない

```
$ cat config/initializers/her.rb 
Her::API.setup url: "http://192.168.0.10:3001" do |c|
  # Request
  c.use Faraday::Request::UrlEncoded

  # Response
  c.use Her::Middleware::DefaultParseJSON

  # Adapter
  c.use Faraday::Adapter::NetHttp
end
```
