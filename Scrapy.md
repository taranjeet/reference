In this tutorial, I will write about how to use **Scrapy** to crawl websites. Scrapy internally uses **lxlm**.

I am assuming that scrapy is installed on the system.

Lets create a new scrapy project 
```shell
$ scrapy startproject new_project
$ cd new_project
```
Lets us define our Items. Items represent the object of the class which we are going to parse or scrape. For this open file **items.py**

```shell
vim new_project/items.py
```
Now write the class here. I am following the sample project on the scrapy website.

```python
import scrapy

class DmozItem(scrapy.Item):
	title=scrapy.Field()
	link=scrapy.Field()
	desc=scrapy.Field()

```

Now lets write our first spider. For this navigate to spiders directory in your project.

```shell
$ cd new_project/spiders
$ touch dmoz_spider.py
```

In the file specify the **name** of the spider, **allowed domain** of the spider, and what will be the **start urls**. Also define a function named **parse** which will tell what the spider will do with the response. The file **dmoz_spider.py** will look like

```python

import scrapy

from new_project.items import DmozItem

class DmozSpider(scrapy.Spider):
	name='dmoz'
	allowed_domains=['dmoz.org']
	start_urls=[
	"http://www.dmoz.org/Computers/Programming/Languages/Python/Books/",
"http://www.dmoz.org/Computers/Programming/Languages/Python/Resources/"
	]

	def parse(self,response):
		for sel in response.xpath('//ul/li'):
			item=DmozItem()
			item['title']=sel.xpath('a/text()').extract()
			item['link']=sel.xpath('a/@href').extract()
			item['desc']=sel.xpath("text()").extract()
			yield item



```

Now start the spider and save the result in a json file

```shell
$ scrapy crawl dmoz -o items.json
```

