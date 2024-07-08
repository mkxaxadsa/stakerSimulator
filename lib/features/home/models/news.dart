class News {
  final String title;
  final String description;
  final String url;
  News({
    required this.title,
    required this.description,
    required this.url,
  });
}

List<News> newsList = [
  News(
    title:
        'Danish brewer Carlsberg to buy soft drinks maker Britvic in \$4 billion deal after improved offer',
    description:
        'LONDON — Soft drinks maker Britvic has agreed to a sweetened takeover bid of £3.28 billion (\$4.2 billion) from Carlsberg, the companies said Monday.\n\nThe deal agreed offered 1,290 pence per share for Britvic, with a small dividend that gives shareholders 1,315 pence per share.',
    url:
        'https://image.cnbcfm.com/api/v1/image/107431710-1718977545145-gettyimages-2157997106-UK_BRITVIC.jpeg?v=1718977564&w=740&h=416&ffmt=webp&vtcrop=y',
  ),
  News(
    title:
        'Southeast Asia\'s IPO market fell drastically in the first half, but AI listings could revive it',
    description:
        'Southeast Asia’s IPO market declined significantly in the first six months of 2024, with market capitalization plunging 71% to \$5.8 billion, a report from Deloitte showed.',
    url:
        'https://image.cnbcfm.com/api/v1/image/108002398-1720402954967-gettyimages-481709562-000069784405_Unapproved.jpeg?v=1720403016&w=740&h=416&ffmt=webp&vtcrop=y',
  ),
  News(
    title:
        'Japan’s stock markets keep testing new highs. Is the rally sustainable?',
    description:
        'Japanese stocks have been on a stellar run in 2024. In February, the country’s benchmark Nikkei 225 smashed through its 1989 high.',
    url:
        'https://image.cnbcfm.com/api/v1/image/108001853-1720152552354-gettyimages-2150515633-AFP_34QL9VU.jpeg?v=1720152566&w=740&h=416&ffmt=webp&vtcrop=y',
  ),
  News(
    title:
        'AI Trading Bot Makes \$38,000 in a Week, Beating Professional Traders',
    description:
        'A new AI Trading Bot, priced at \$450, is accessible on any Windows OS, even older PCs or laptops. Technical traders are saying it\'s unfair, but it\'s legal and users are reporting significant earnings.',
    url:
        'https://miro.medium.com/v2/resize:fit:834/1*GnGqRTTWBhWqdwaVFUfCmg.jpeg',
  ),
  News(
    title:
        'Stocks making the biggest moves midday: Macy’s, MicroStrategy, Coinbase, Nvidia and more',
    description:
        'Nvidia — Shares of the artificial intelligence darling fell about 2% after a rare negative call on Wall Street. New Street Research downgraded Nvidia to hold from buy, citing limited upside given the big run already this year. It is only the second downgrade of Nvidia this year.',
    url:
        'https://image.cnbcfm.com/api/v1/image/107433665-1719419621393-gettyimages-2158585102-Illustration_Nvidia_Shares_Fall.jpeg?v=1720194820&w=740&h=416&ffmt=webp&vtcrop=y',
  ),
  News(
    title:
        'Stocks making the biggest moves premarket: Macy’s, Tesla, Novo Nordisk and more',
    description:
        'Crypto stocks — Stocks tied to bitcoin price slid after the cryptocurrency dropped 5% to its lowest level since February, with the now defunct Mt. Gox exchange beginning repayments to creditors, as expected. Coinbase and MicroStrategy each lost 5% in premarket trading. Among miners, Iris Energy tumbled 8%, while CleanSpark fell 5%. Marathon Digital and Riot Platforms were down 6% and 4%, respectively.',
    url:
        'https://image.cnbcfm.com/api/v1/image/107417208-1716211775737-gettyimages-2152068538-img_0990_mayc02_05062024.jpeg?v=1720183504&w=740&h=416&ffmt=webp&vtcrop=y',
  ),
  News(
    title: 'China\'s car sales slide in June, falling for third month running',
    description:
        'BEIJING (Reuters) -China\'s June car sales fell 6.9% from a year earlier, extending declines for a third straight month as government incentives failed to spur consumer demand in a sputtering economic recovery.',
    url:
        'https://s.yimg.com/ny/api/res/1.2/3cNnyTrxxtwybBAvfEBizA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MTtjZj13ZWJw/https://media.zenfs.com/en/reuters-finance.com/e72487e6f7688f3035ac61631eea9849',
  ),
  News(
    title:
        '2 Dividend Growth Stocks With Yields up to 5.5% That Are Screaming Buys in July',
    description:
        'As July gets underway, the S&P 500 index sits near all-time highs. The yield on the index is below 1.3%, which isn\'t nearly enough to get a retired income investor\'s attention. But yields above 4%, now that\'s a different story.',
    url:
        'https://s.yimg.com/ny/api/res/1.2/olJd7t_VZcLfWFsVQACNbw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MDtjZj13ZWJw/https://media.zenfs.com/en/motleyfool.com/f8a59465d87d382b9d75360b62e26da4',
  ),
  News(
    title:
        'Tesla stock rises again, extending monster 40% rally over the last month',
    description:
        'Tesla stock (TSLA) rose 2% on Friday as shares extended their winning streak for an eighth straight session and erased their year-to-date losses.',
    url:
        'https://s.yimg.com/ny/api/res/1.2/JoX0VcH1Jqid.PfFrAgBAw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0NjtjZj13ZWJw/https://s.yimg.com/os/creatr-uploaded-images/2023-08/615770f0-3c1e-11ee-9fea-99762e8ff431',
  ),
  News(
    title: 'SNB\'s Jordan blames Credit Suisse bosses for bank\'s crash',
    description:
        'ZURICH, July 5 (Reuters) - Credit Suisse\'s collapse was caused by the bank\'s management, not by Swiss financial authorities, Swiss National Bank Chairman Thomas Jordan was quoted as saying on Friday.',
    url:
        'https://www.reuters.com/resizer/v2/https%3A%2F%2Fcloudfront-us-east-2.images.arcpublishing.com%2Freuters%2FAZMWXRMMPBPR7P5I2ETFBNINHY.jpg?auth=93712147dec73afa6c828cab64e8f0642af830fc1123032812b573c8ea7c06b3&width=1920&quality=80',
  ),
  News(
    title:
        'Payments processor NCR Voyix explores sale of digital banking unit, sources say',
    description:
        'Payments processor NCR Voyix (VYX.N), opens new tab is exploring the sale of its digital banking business which it hopes will fetch as much as \$3 billion, people familiar with the matter said. Atlanta, Georgia-based NCR Voyix has tapped Goldman Sachs (GS.N), opens new tab to solicit interest from potential buyers, which include private equity firms and other payments processors, said the sources, who requested anonymity as the discussions are confidential.',
    url:
        'https://www.reuters.com/resizer/v2/LZGWQZP4EFMXVKUKNJF37IR76I.jpg?auth=69130bfcf57760b016574b74c55374a8351d9dd7f4da7a5e1abf7531b87c2dde&width=640&quality=80',
  ),
];
