import scrapy

class PlatoSpider(scrapy.Spider):
    name = 'plato'
    start_urls = ['https://plato.stanford.edu/contents.html']

    

    def parse(self, response):
        entry_links = response.xpath('//a[contains(@href, "entries")]/@href').getall()
        yield from response.follow_all(entry_links, callback=self.parse_entry)
    
    def parse_entry(self, response):
        related_entries = response.xpath('//div[@id="related-entries"]//a/@href').getall()
        related_entries = [response.urljoin(entry) for entry in related_entries]
        title = response.xpath('//meta[@property="citation_title"]/@content').get()
        url = response.url
        authors = response.xpath('//meta[@property="citation_author"]/@content').getall()
        publication_date = response.xpath('//meta[@property="citation_publication_date"]/@content').get()
        abstract = response.xpath('string(//div[@id="preamble"])').get().replace('\n',' ').strip()
        full_article_with_tags = response.xpath('//div[@id="main-text"]').get()
        bibliography_with_tags = response.xpath('//div[@id="bibliography"]').get()
        yield {
            'title':title,
            'url':url,
            'related_entries': related_entries,
            'abstract': abstract,
            'publication_date': publication_date,
            'authors':authors,
            'full_article_with_tags': full_article_with_tags,
            'bibliography': bibliography_with_tags
        }