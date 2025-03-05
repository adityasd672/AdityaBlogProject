/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.33 : Database - universal_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`universal_blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `universal_blog`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `category` */

LOCK TABLES `category` WRITE;

insert  into `category`(`cid`,`description`,`name`) values 
(101,'Technology-related articles','Technology'),
(102,'Health and wellness topics','Health'),
(103,'Travel experiences and guides','Travel'),
(104,'Food recipes and culinary tips','Food'),
(105,'Latest trends in fashion','Fashion');

UNLOCK TABLES;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `comId` int NOT NULL,
  `cContent` varchar(200) DEFAULT NULL,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`comId`),
  KEY `FK_POST_COMMENT` (`pid`),
  KEY `FK_USER_COMMENT` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `comments` */

LOCK TABLES `comments` WRITE;

insert  into `comments`(`comId`,`cContent`,`pid`,`uid`) values 
(27,'Great Blog!',7,1);

UNLOCK TABLES;

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hibernate_sequence` */

LOCK TABLES `hibernate_sequence` WRITE;

insert  into `hibernate_sequence`(`next_val`) values 
(48),
(48),
(48),
(48),
(48);

UNLOCK TABLES;

/*Table structure for table `likes` */

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `lid` int NOT NULL,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `FK_POST_LIKE` (`pid`),
  KEY `FK_USER_LIKE` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `likes` */

LOCK TABLES `likes` WRITE;

insert  into `likes`(`lid`,`pid`,`uid`) values 
(11,4,9),
(16,5,1),
(17,6,1),
(26,7,1),
(19,8,1);

UNLOCK TABLES;

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `pid` int NOT NULL,
  `pCode` varchar(255) DEFAULT NULL,
  `pContent` text,
  `pDate` datetime DEFAULT NULL,
  `pPic` varchar(255) DEFAULT NULL,
  `pTitle` varchar(255) DEFAULT NULL,
  `cid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `FK_CATEGORY_POST` (`cid`),
  KEY `FK_USER_POST` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `post` */

LOCK TABLES `post` WRITE;

insert  into `post`(`pid`,`pCode`,`pContent`,`pDate`,`pPic`,`pTitle`,`cid`,`uid`) values 
(4,'','With the rapid advancement of technology, 5G has emerged as the next generation of mobile network technology. Promising faster speeds, lower latency, and enhanced connectivity, 5G is set to revolutionize industries and daily life. But what exactly does 5G offer, and how will it impact the world? Letâs explore.\r\n\r\n1. Unprecedented Internet Speeds\r\n\r\n5G networks provide significantly higher data transfer speeds compared to 4G LTE. With theoretical speeds reaching up to 10 Gbps, downloading large files, streaming 4K videos, and gaming will become smoother and nearly instantaneous. This speed boost will also enhance cloud computing and remote work efficiency.\r\n\r\n2. Lower Latency for Real-Time Communication\r\n\r\nOne of the biggest advantages of 5G is reduced latency, with response times as low as 1 millisecond. This is crucial for applications like autonomous vehicles, remote surgeries, and virtual reality, where real-time communication is essential. Lower latency will also improve online gaming and video conferencing experiences.\r\n\r\n3. Improved Connectivity and Network Capacity\r\n\r\n5G supports a massive number of connected devices simultaneously. This is particularly important for the Internet of Things (IoT), where smart devices like home automation systems, wearables, and industrial sensors rely on seamless connectivity. Smart cities, intelligent transportation, and connected healthcare will benefit greatly from this feature.\r\n\r\n4. Enhancing Business and Industry\r\n\r\nIndustries such as manufacturing, healthcare, and logistics will see major advancements with 5G. Automated factories with AI-driven machines, telemedicine with real-time patient monitoring, and efficient supply chain management will become more feasible. Businesses will also leverage 5G for innovative solutions and automation.\r\n\r\n5. Challenges and Implementation\r\n\r\nDespite its benefits, 5G implementation faces challenges such as infrastructure costs, security concerns, and potential health-related debates. Governments and telecom providers must work together to ensure widespread deployment while addressing privacy and security risks.\r\n\r\nConclusion\r\n\r\n5G technology is set to reshape the digital world, offering faster speeds, improved connectivity, and endless possibilities for innovation. While challenges exist, the future of 5G holds immense potential for transforming industries and improving everyday experiences. As global adoption increases, we can expect a smarter, more connected world.','2025-02-28 10:44:32','tech2.jpg','5G Technology: What It Means for Internet Speed and Connectivity',101,1),
(5,'','Blockchain technology is often associated with cryptocurrencies like Bitcoin and Ethereum, but its potential extends far beyond digital currency. From supply chain management to healthcare, blockchain is transforming various industries by providing transparency, security, and efficiency. Letâs explore some real-world applications of blockchain technology.\r\n\r\n1. Supply Chain Management\r\nBlockchain enhances supply chain transparency by providing an immutable ledger for tracking goods. Companies like IBM and Walmart use blockchain to trace product origins, ensuring authenticity and reducing fraud. This technology helps in food safety, ethical sourcing, and reducing inefficiencies.\r\n\r\n2. Healthcare and Medical Records\r\nBlockchain secures patient records, ensuring data integrity and accessibility. By enabling decentralized, tamper-proof medical histories, it helps reduce errors and improve patient care. Startups like Medicalchain and projects like Estoniaâs e-Health system are pioneering blockchain in healthcare.\r\n\r\n3. Smart Contracts and Legal Industry\r\nSmart contracts are self-executing agreements with terms written into code. They eliminate intermediaries, reducing costs and execution time for legal and financial transactions. Ethereumâs blockchain powers many smart contract applications in business and real estate.\r\n\r\n4. Voting Systems and Governance\r\nBlockchain-based voting can enhance election security and transparency. It reduces voter fraud and ensures accurate, tamper-proof results. Countries like Estonia and companies like Voatz are experimenting with blockchain-based voting to improve democracy.\r\n\r\n5. Decentralized Finance (DeFi) and Banking\r\nBlockchain is reshaping finance through decentralized finance (DeFi). Platforms like Uniswap and Aave enable users to lend, borrow, and trade without traditional banks. This democratizes access to financial services, especially in underbanked regions.\r\n\r\nConclusion\r\nBlockchainâs applications go far beyond cryptocurrency, offering security, transparency, and efficiency across industries. As adoption grows, blockchain will continue to revolutionize various sectors, making transactions more secure and reliable.','2025-02-28 10:47:23','tech3.jpg','Blockchain Beyond Cryptocurrency: Real-World Applications',101,1),
(6,'','Street food has been a staple of culinary culture for centuries, offering affordable, delicious, and convenient meals. Over time, it has evolved from simple, locally inspired dishes to a global phenomenon that showcases the diversity of world cuisine. Letâs explore how street food has transformed and continues to shape the way we eat.\r\n\r\n1. The Origins of Street Food\r\n\r\nHistorically, street food has been an essential part of urban life, dating back to ancient civilizations. From the Roman Empireâs bread and wine vendors to Chinaâs night markets, street food has always been a quick and accessible dining option for people on the go.\r\n\r\n2. Cultural Diversity and Unique Flavors\r\n\r\nEvery country has its own version of street food, reflecting its rich culinary traditions. Whether itâs Indiaâs spicy chaats, Mexicoâs flavorful tacos, or Japanâs sushi rolls, street food brings local flavors to life. Each dish tells a story of cultural heritage and regional influence.\r\n\r\n3. Street Food Goes Global\r\n\r\nIn recent years, street food has gained worldwide popularity, with food trucks, pop-up markets, and international food festivals making local delicacies accessible to a global audience. Many traditional street foods are now being adapted and reinvented with modern twists in high-end restaurants.\r\n\r\n4. The Impact of Innovation and Technology\r\n\r\nTechnology has played a huge role in revolutionizing street food. Online food delivery services, digital payments, and social media marketing have helped small vendors reach a wider customer base. Additionally, hygiene standards and food safety regulations are improving street food quality worldwide.\r\n\r\n5. Sustainable and Healthy Street Food Options\r\n\r\nAs consumer preferences shift towards healthier and sustainable eating, street food vendors are adapting by offering organic, plant-based, and eco-friendly options. Many stalls now use biodegradable packaging, locally sourced ingredients, and innovative cooking methods to cater to health-conscious customers.\r\n\r\nConclusion\r\n\r\nStreet food continues to evolve, blending tradition with modern culinary innovations. As it becomes more accessible and diverse, it offers people an opportunity to explore global flavors while supporting local businesses. Whether youâre enjoying a quick snack on the go or exploring a bustling food market, street food remains an exciting and essential part of global gastronomy.','2025-02-28 10:55:02','food2.jpg','The Evolution of Street Food: From Local Delicacies to Global Phenomenon',104,1),
(7,'','Traveling doesnât have to break the bank. With the right planning, you can explore stunning destinations without spending a fortune. Here are ten budget-friendly travel destinations for 2025 that offer affordability without compromising on adventure, culture, and beauty.\r\n\r\n1. Vietnam\r\n\r\nVietnam is an incredible destination known for its breathtaking landscapes, rich history, and delicious street food. From the bustling streets of Hanoi to the stunning Ha Long Bay and the cultural sites of Hoi An, you can travel here on a very low budget. Accommodation, food, and transportation are extremely affordable.\r\n\r\n2. Indonesia\r\n\r\nBali might be popular, but Indonesia has much more to offer. Places like Yogyakarta, Lombok, and Sumatra provide amazing travel experiences at a fraction of the cost. You can find cheap accommodations, affordable street food, and breathtaking natural scenery.\r\n\r\n3. India\r\n\r\nIndia is one of the most budget-friendly destinations, offering incredible diversity. Whether you explore the beaches of Goa, the mountains of Himachal Pradesh, or the cultural heritage of Rajasthan, you can find cheap food, accommodations, and transport options.\r\n\r\n4. Bolivia\r\n\r\nSouth America can be expensive, but Bolivia remains one of the cheapest countries to visit. The stunning Salar de Uyuni salt flats, the beautiful Lake Titicaca, and the bustling city of La Paz are all accessible on a budget.\r\n\r\n5. Hungary\r\n\r\nFor budget travelers wanting to explore Europe, Hungary is a great option. Budapest, the capital city, is famous for its stunning architecture, thermal baths, and vibrant nightlifeâall at reasonable prices compared to Western Europe.\r\n\r\n6. Mexico\r\n\r\nMexico offers incredible diversity, from the beaches of Cancun to the cultural richness of Oaxaca. Street food is delicious and affordable, and public transport is budget-friendly. Avoid tourist-heavy areas for an even cheaper experience.\r\n\r\n7. Georgia\r\n\r\nThe country of Georgia is an underrated gem in the Caucasus region. It offers breathtaking mountain landscapes, delicious food, and rich historyâall at incredibly affordable prices. Tbilisi, the capital, is charming and welcoming.\r\n\r\n8. Romania\r\n\r\nEastern Europe is still one of the best budget-friendly regions, and Romania is a great choice. The medieval towns of Transylvania, the beautiful Carpathian Mountains, and the vibrant city of Bucharest are all accessible on a low budget.\r\n\r\n9. Philippines\r\n\r\nIf you love tropical destinations, the Philippines is an affordable paradise. With over 7,000 islands, you can find stunning beaches, clear waters, and breathtaking landscapes without spending too much.\r\n\r\n10. Morocco\r\n\r\nMorocco offers a mix of vibrant culture, historical sites, and stunning landscapes. From the bustling souks of Marrakech to the Sahara Desert and the blue city of Chefchaouen, traveling here is surprisingly affordable.\r\n\r\nFinal Tips for Budget Travel\r\n\r\nTravel during the off-season to get cheaper flights and accommodations.\r\n\r\nUse public transport instead of taxis.\r\n\r\nStay in hostels, guesthouses, or use platforms like Couchsurfing.\r\n\r\nEat at local restaurants and street food stalls.\r\n\r\nLook for free activities and attractions.\r\n\r\nThese destinations prove that you donât need a fortune to explore the world. With the right approach, travel can be both affordable and unforgettable in 2025!','2025-02-28 10:58:30','travel1.jpg','10 Budget-Friendly Travel Destinations for 2025',103,1),
(8,'','Introduction\r\nFashion trends constantly evolve, but one timeless style that continues to gain popularity is minimalist fashion. The concept revolves around simplicity, functionality, and neutral colors, making it a go-to for those who prefer effortless elegance.\r\n\r\nKey Elements of Minimalist Fashion\r\nNeutral Color Palette: Shades like black, white, beige, and grey dominate minimalist wardrobes.\r\nClean Silhouettes: Structured yet simple designs with a tailored fit.\r\nHigh-Quality Fabrics: Cotton, linen, and wool are often preferred for their durability and comfort.\r\nLess Accessories: Minimalist outfits are typically paired with one or two statement accessories to maintain a refined look.\r\nWhy Minimalism?\r\nMinimalist fashion reduces wardrobe clutter, makes outfit selection easier, and promotes sustainability by focusing on long-lasting pieces rather than fast fashion trends.\r\n\r\nConclusion\r\nMinimalist fashion isnât just about clothingâitâs a lifestyle choice that embraces quality over quantity. Whether itâs a crisp white shirt or a structured blazer, simplicity never goes out of style.\r\n\r\nStreetwear: How It Became a Global Phenomenon\r\nIntroduction\r\nWhat started as a niche subculture has now transformed into a billion-dollar industry. Streetwear, influenced by skateboarding, hip-hop, and urban fashion, has taken over runways and mainstream culture.\r\n\r\nKey Features of Streetwear\r\nGraphic Tees: Logos and bold prints define streetwear aesthetics.\r\nOversized Fits: Loose silhouettes provide comfort and a relaxed vibe.\r\nSneakers Culture: Limited-edition sneaker drops fuel the hype around street fashion.\r\nMix of High and Low Fashion: Streetwear effortlessly combines luxury brands with casual staples.\r\nThe Role of Social Media\r\nPlatforms like Instagram and TikTok have fueled the streetwear movement, turning independent designers into global brands overnight. Celebrity endorsements also play a crucial role in boosting its popularity.\r\n\r\nFuture of Streetwear\r\nWith sustainability gaining importance, eco-friendly streetwear brands are emerging. Expect to see more sustainable fabrics, ethical production, and digital fashion influencing the future of this trend.\r\n\r\nFashion Trends to Watch in 2025\r\n1. Sustainable Fashion\r\nConsumers are demanding eco-friendly clothing, leading to the rise of biodegradable fabrics and recycled materials in mainstream fashion.\r\n\r\n2. Tech-Integrated Wearables\r\nSmart fabrics with temperature control, self-cleaning properties, and even LED designs are expected to dominate fashion in the coming years.\r\n\r\n3. Vintage Revival\r\nStyles from the â70s, â80s, and â90s continue to make a comeback, with flared jeans, oversized blazers, and retro prints trending.\r\n\r\n4. Gender-Neutral Fashion\r\nBrands are shifting towards inclusivity, with unisex clothing lines that blur the lines between menâs and womenâs fashion.\r\n\r\n5. Maximalism\r\nWhile minimalism still thrives, 2025 will also see a surge in bold patterns, bright colors, and extravagant accessories.\r\n\r\nConclusion\r\nFashion never stands still, and 2025 is set to bring a mix of innovation, sustainability, and nostalgia. Keep an eye on these trends as they shape the future of the industry.','2025-02-28 11:02:26','fashion1.jpg','The Rise of Minimalist Fashion: Less is More',105,1);

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL,
  `about` varchar(255) DEFAULT NULL,
  `dateTime` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `isBlocked` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`about`,`dateTime`,`email`,`gender`,`isBlocked`,`name`,`password`,`profile`,`role`) values 
(1,'Hey! I am a user.','2025-02-28 10:14:48','radhe@gmail.com','male','\0','Radhe Mohan','Adityasd672@','default_pic.jpeg','admin'),
(30,'Hey! I am an artist.','2025-03-01 09:31:48','Aditya@gmail.com','female','\0','Nitya Tiwari','Adityasd672@','default_pic.jpeg','user'),
(9,'Hey! I am a user.','2025-02-28 11:06:20','Alok@gmail.com','male','\0','Alok Singh Devda','Aloksd672@','profile_man.jpg','user'),
(38,'Hey! I am a user.','2025-03-01 12:14:15','adityasd672@gmail.com','male','\0','Nidhi Kushwah','Adityasd672@','default_pic.jpeg','user'),
(39,'Hey! I am a user.','2025-03-01 12:27:32','radhe2@gmail.com','male','\0','Alok Singh Deoda','Adityasd672@','default_pic.jpeg','user');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
