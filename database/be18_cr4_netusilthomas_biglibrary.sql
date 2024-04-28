-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 27. Mrz 2023 um 12:29
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `be18_cr4_netusilthomas_biglibrary`
--
CREATE DATABASE IF NOT EXISTS `be18_cr4_netusilthomas_biglibrary` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be18_cr4_netusilthomas_biglibrary`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `isbn` char(13) NOT NULL,
  `short_description` text NOT NULL,
  `item_type` enum('BOOK','CD','DVD') NOT NULL DEFAULT 'BOOK',
  `picture` varchar(64) NOT NULL DEFAULT 'product.png',
  `author_first_name` varchar(32) NOT NULL,
  `author_last_name` varchar(64) NOT NULL,
  `publisher_name` varchar(32) NOT NULL,
  `publisher_address` varchar(255) NOT NULL,
  `publish_date` date NOT NULL DEFAULT '2000-10-10',
  `available` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `item`
--

INSERT INTO `item` (`id`, `title`, `isbn`, `short_description`, `item_type`, `picture`, `author_first_name`, `author_last_name`, `publisher_name`, `publisher_address`, `publish_date`, `available`) VALUES
(11, 'Qualityland: Visit Tomorrow, Today! (English Edition)', '978-140919113', 'We hope you enjoy your trip to the happiest, most advanced place on earth.\r\n\r\nQualityLand is the world\'s first 2.0 country, where everything is run by infallible algorithm, including:\r\n\r\n- Society (in which everyone is ranked by level)\r\n- Shopping (orders arrive before you even know you want them)\r\n- Relationships (you will be notified instantly if there is a better match)\r\n\r\nIn fact, this very algorithm selected you to visit QualityLand. If you don\'t like it, you\'re not just ungrateful - you\'re also wrong, because the algorithm is always right.\r\n\r\nWhile you\'re visiting, be aware there is an election going on - the perfect time to see QualityLand in action...', 'BOOK', '641e793575298.jpg', 'Marc-Uwe', 'Kling', 'Orion', 'Hachette UK – Head OfficeCarmelite House50 Victoria EmbankmentLondonEC4Y 0DZ', '2020-02-20', '1'),
(13, '2001: A Space Odyssey', '7321921650000', '2001: A Space Odyssey is a 1968 epic science fiction film produced and directed by Stanley Kubrick. The screenplay was written by Kubrick and science fiction author Arthur C. Clarke, and was inspired by Clarke\'s 1951 short story \"The Sentinel\" and other short stories by Clarke. Clarke also published a novelisation of the film, in part written concurrently with the screenplay, after the film\'s release. The film stars Keir Dullea, Gary Lockwood, William Sylvester, and Douglas Rain, and follows a voyage by astronauts, scientists and the sentient supercomputer HAL to Jupiter to investigate an alien monolith.\r\n\r\nThe film is noted for its scientifically accurate depiction of space flight, pioneering special effects, and ambiguous imagery. Kubrick avoided conventional cinematic and narrative techniques; dialogue is used sparingly, and there are long sequences accompanied only by music. The soundtrack incorporates numerous works of classical music, by composers including Richard Strauss, Johann Strauss II, Aram Khachaturian, and György Ligeti.\r\n\r\nThe film received diverse critical responses, ranging from those who saw it as darkly apocalyptic to those who saw it as an optimistic reappraisal of the hopes of humanity. Critics noted its exploration of themes such as human evolution, technology, artificial intelligence, and the possibility of extraterrestrial life. It was nominated for four Academy Awards, winning Kubrick the award for his direction of the visual effects. The film is now widely regarded as one of the greatest and most influential films ever made. In 1991, it was deemed \"culturally, historically, or aesthetically significant\" by the United States Library of Congress and selected for preservation in the National Film Registry.[2][3] In the Sight & Sound poll of 480 directors published in December 2022, 2001: A Space Odyssey was voted as the Greatest Film of All Time, ahead of Citizen Kane and The Godfather. ', 'DVD', '641e8c5df0907.jpg', 'Stanley', 'Kubrick', 'Warner Home Video', 'Warner Bros. Entertainment GmbHHumboldtstraße 6222083 Hamburg', '2006-06-01', '1'),
(15, 'Das Lied von der Erde', '8364798023650', 'Das Lied von der Erde entstand 1908 in Toblach[1]. In dieser Zeit beschäftigte Mahler sich mit Hans Bethges Sammlung Die Chinesische Flöte mit Nachdichtungen altchinesischer Lyrik. Mahler komponierte das Werk in einer Zeit privater Schicksalsschläge. So starb Mahlers ältere Tochter Maria Anna im Alter von vier Jahren an Diphtherie. Außerdem hatte er nach einer antisemitisch motivierten Pressekampagne gegen seine Person als Direktor der Wiener Hofoper zurücktreten müssen. Schließlich wurde in diesem Jahr eine schwere Herzkrankheit diagnostiziert, die wenige Jahre später zu seinem Tod führte. Kurz vor der Vollendung des Werkes schrieb Mahler an Bruno Walter: „Ich war sehr fleißig. […] Ich weiß es selbst nicht zu sagen, wie das Ganze benamst werden könnte. Mir war eine schöne Zeit beschieden und ich glaube, daß es wohl das Persönlichste ist, was ich bis jetzt gemacht habe.“[2] Diese Zeilen zeigen große Wertschätzung Mahlers für sein Werk und gleichzeitig Unsicherheit über die Einordnung der Form. Das Werk steht zwischen Orchester-Liedzyklus und Sinfonie. ', 'DVD', '641e8a39c5d08.jpg', 'Gustav', 'Maler', 'Naxos', 'Gruber Str. 46b, 85586 Poing, Deutschland', '1968-01-01', '1'),
(25, 'The Kangaroo Method: How to Unlock Your Verbal Intelligence & Be', '9781890679132', 'Learning is the pathway to becoming the person you most want to be. Using simple steps and personal stories, the author reveals the way to unlock and raise verbal intelligence. Discover how to read and learn in high definition and find out how to become truly competent in your chosen field.\r\n\r\nDonald Russell Woodruff has taught learning strategy courses in over 25 colleges across the United States. His techniques have been presented to the staff of NASA headquarters and have been shared around the world on Voice of America television. His book will allow you to gain a fresh start on your academic and career goals by providing easy-to-use techniques combined with powerful insights.\r\n\r\nFrom chapter one:\r\n\r\nFrom the results of surveys of more than 10,000 back-to-college and professional adults from around the country, I am convinced that The Kangaroo Method will unlock your verbal intelligence and give you the intellectual boost you have long been seeking. Imagine capturing how-to information, studying for an exam, or reading a challenging book in high definition. The insights and techniques I share here are those I hope you will put into your own words and share with your children.\r\n\r\n“I have seen Donald Russell Woodruff in action, and he has mastered the art and science of learning. He is sharing his playbook for those who want to learn this vital skill. If you are going back to school or know someone who is, this should be the first book you pick up.” (Major Alvi Azad, psychiatrist and clinical fellow at Yale University)\r\n\r\n\"Delineating several common barriers to learning and offering ways in which to overcome these educational obstacles, Woodruff summarizes and simplifies the learning process. The Kangaroo Method embodies a truth about education (and ourselves), which, if applied, has the power to unlock our verbal intelligence and even increase our IQ.\" (Christopher Ackerman, IP Book Reviewers)\r\n', 'CD', '641e8e1f9f0b9.jpg', 'Marc-Uwe', 'Kling', 'Donald Russell Woodruff', 'n/a Limited Paperback Editions available through emailing Don at KangarooWisdom@gmail.com: ', '2021-05-24', '1'),
(36, 'QualityLand 2.0', '9783550201028', '\r\nWillkommen in QualityLand, in einer nicht allzu fernen Zukunft: Alles läuft rund - Arbeit, Freizeit und Beziehungen sind von Algorithmen optimiert. Trotzdem beschleicht den Maschinenverschrotter Peter Arbeitsloser immer mehr das Gefühl, dass mit seinem Leben etwas nicht stimmt. Wenn das System wirklich so perfekt ist, warum gibt es dann Drohnen, die an Flugangst leiden, oder Kampfroboter mit posttraumatischer Belastungsstörung? Warum werden die Maschinen immer menschlicher, aber die Menschen immer maschineller? Marc-Uwe Kling hat die Verheißungen und das Unbehagen der digitalen Gegenwart zu einer verblüffenden Zukunftssatire verdichtet, die lange nachwirkt. Visionär, hintergründig – und so komisch wie die Känguru-Trilogie.\r\n', 'BOOK', '641e92946bc87.jpg', 'Marc-Uwe', 'Kling', 'Orion', 'Hachette UK – Head Office Carmelite House 50 Victoria Embankment London EC4Y 0DZ', '2020-10-07', '0'),
(37, 'WOODSTOCK Special Edition (2-Discs) [Director\'s Cut]', '26371004', 'Die Wiederauferstehung eines der größten Momente des 20. Jahrhunderts. Das bekannteste Rockereignis aller Zeiten. 1969 versammelten sich eine halbe Million Menschen in der Nähe des kleinen Ortes Woodstock, um den bedeutendsten Musikern ihrer Generation zuzuhören. Drei Tage des Friedens, der Musik und der Liebe. Drei Stunden unvergessene Bilder und faszinierende Musik einer Zeit, die heute noch genauso lebendig ist, wie vor zwanzig Jahren. THE WHO \"We\'re Not Gonna Take It\", TEN YEARS AFTER \"I\'m Going Home\", JOE COCKER \"With A Little Help From My Friends\", CROSBY, STILLS, NASH AND YOUNG \"Wooden Ships\", JIMI HENDRIX \"Purple Haze\", SLY & THE FAMILY STONE \"I Want To Take You Higher\", SANTANA \"Soul Sacrifice\", RICHIE HAVENS \"Freedom\", SHA-NA-NA \"At The Hop\", JOAN BAEZ \"Joe Hill\".', 'CD', '641e93eb1decb.jpg', '', 'Woodstock', 'Warner Home Video', 'Warner Bros. Entertainment GmbH Humboldtstraße 62 22083 Hamburg', '2009-07-24', '1'),
(38, 'Galerie Ariadne 1968 - 2003', '5552343223556', 'The Gallery Ariadne was founded in October 1968 by the well know art collector Rudolf Leopold (Leopold Museum) and George \r\nMcGuire, who was at that time a music student in Vienna. Within a couple of years George McGuire opened the Gallery Ariadne \r\nCologne in 1971 and in 1973 the Ariadne Gallery New York followed as one of the first galleries in SoHo.\r\nMcGuire showed the most well known artists from Vienna for example Avramidis, Brus, Eisler, Frohner, Hausner, Hollegha, Hrdlicka, \r\nHundertwasser, Hutter, Lassnig, Moldovan, Pichler, Schilling, Urteil, Lehmden and young artists like Angeli, Korab, Messensee, \r\nPongratz, Scheidl, Sengl, Wukounig et.al. The Gallery Ariadne started with editing editions. Among the artists who produced special \r\nworks for the gallery one finds famous names like Attersee, Fuchs, Heuer, Kolig, Mikl, Prachensky, Rainer as well as Ernst Steiner and \r\nthe Bauhaus artist Kurt Krantz.\r\nTogether with Roman Haubenstock-Ramati George McGuire founded the Ariadne Musikverlag in order to publish \"musical graphics\", which represents an object of art as well as a notation. Recordings with Eta Harich-Schneider, the famous “grand dame” of the \r\nCembalo also belong to the spectrum of the Ariadne Edition.\r\nIn 1976 Ferdinand Netusil took over the Gallery Ariadne and continued with a different programme: While McGuire particularly \r\nshowed already famous artists from Vienna, the new Ariadne specialized in the promotion of young artists. The austrian \"Neuen \r\nWilden\" like Siegfried Anzinger, Erwin Bohatsch, Gunter Damisch, Alois Mosbacher, Hubert Schmalix as well as Johanna Kandl, Josef \r\nKern, Alfred Klinkan, Siegfried Kaden, Thomas Stimm, Edgar Tezak had a fist important exhibition or even their first presentation in the \r\nGallery Ariadne. Subsequently a lot of talented artists came to our gallery who became well known in the meantime. Among them were \r\nfor example Anatole Ak, Joe Allen, Dietmar Brehm, Ferran Garcia Sevilla, Anselm Glück, Brian Gormley, Dietmar Hollenstein Robert \r\nKabas, Clemens Kaletsch, Karl Heinz Klopf, Ronald Kodritsch, Florin Kompatscher, Heimo Lattner, Cat Loray, William MacKendree, \r\nFerdinand Melichar, Robert Mittringer, Emmanuelle Renard, David Spiller, Turi Werkner, Johanes Zechner.\r\nBeside participations in important art fairs such as Basel, Chicago, Düsseldorf, Frankfurt, Cologne, Los Angeles, Madrid, Montreal or \r\nParis Ariadne showed artists in international exhibitions, for example the \"Aperto 80\" at the Biennale in Venice, the \"Zeitgeist\"-Exhibition \r\nin Gropiusbau in Berlin or at the \"Museum of Modern Art\", New York.\r\nAriadne cooperated with galleries like the Gallery Eric Devlin, Montreal, the legendary Gallery \"Fashion Moda\" in the Bronx/New \r\nYork or Ferran Cano, the Gallery of Juan Miro in Majorca in summer 1986.\r\nIn March 1985 Ariadne started a series of exhibitions called \"Wir stellen vor\" (\"We Present\") in which about 127 artists showed their \r\nwork for the first time in Austria. The artists came from Austria, USA, France, Great Britain, the Netherlands, Germany, Switzerland, \r\nItaly, as well as from Spain, Poland, Turkey, Korea, Iraq or from the Philippines. Artists like Iris Andraschek, Martin Brausewetter, Oliver \r\nDorfer, Marbod Fritsch, Nikolaus Moser, Tobias Pils, Horacio Sapere and Manfred Schluderbacher to name but a few.\r\nWhile including young artists like Matthias Baumgartner, Uta Heinecke, Udo Hohenberger and Pawel Mendrek in our constant programme, we continue our way since 25 years by showing young, not yet established artists.\r\nAfter our presentation of photographs of Walker Evan in 1977 we present this medium more often in the 90s, for example works of \r\nHeinz Grosskopf or also from young photographers like Lydia Lenzenhofer, Casaluce-Geiger, Michaela Göltl and Christa Zauner.\r\nIn June 2003 we will present a show of Ronnie Wood art work in our gallery and in autumn an exhibition of the indian Pawin \r\nChercoori, he finance his own hospital for poor in India with his income.\r\nIn autumn 2000 the gallery opend its gates in the world wide web: www.ariadne.at. More than 60.000 visitors per month are much more than we ever expected.\r\n', 'BOOK', '641e960da4f63.png', 'Ferdinand und Thomas', 'Netusil', 'Red Dot Design Limited', '63 Rosendale Road London SE21 8DY', '2003-03-02', '1'),
(39, 'Live Aid : 20 Years Ago Today [Limited Edition]', '0825646246427', 'Tracklisting: 01 Regimental Band Of The Coldstream Guards - Royal Salute 02 Status Quo - Rockin\' All Over The World 03 The Boomtown Rats - I Don\'t Like Mondays 04 The Style Council - Walls Come Tumbling Down 05 Ultravox - Vienna 06 Spandau Ballet - True 07 Bryan Ferry - Slave To Love 08 Nik Kershaw - Wouldn\'t It Be Good 09 Sade - Your Love Is King 10 Paul Young & Alison Moyet - That\'s The Way Love Is 11 Sting - Roxanne 12 Howard Jones - Hide & Seek 13 Elvis Costello - Love Is All You Need 14 Dire Staits & Sting - Money For Nothing 15 U2 - Sunday Bloody Sunday 16 Bryan Adams - Kids Wanna Rock 17 Run DMC - King Of Rock 18 Kenny Loggins - Footloose 19 Neil Young - Nothing Is Perfect (In God\'s Perfect Plan) 20 The Cars - Just What I Needed 21 Tom Petty & The Heartbreakers - American Girl 22 The Pretenders - Stop Your Sobbing 23 Simple Minds - Don\'t Forget About Me 24 Judas Priest - Living After Midnight 25 Madonna - Holiday 26 The Beach Boys - Wouldn\'t It Be Nice 27 Crosby, Stills & Nash - Teach Your Children 28 Queen - Radio Ga Ga (full length) 29 David Bowie - Herpes 30 The Who - Won\'t Get Fooled Again 31 Elton John - Bennie & The Jets 32 Billy Conolly - tba. 33 Elton John & George Michael - Don\'t Let The Sun Go Down On Me 34 Phil Collins - In The Air Tonight 35 Eric Clapton - Layla 36 Duran Duran - The Reflex 37 Hall & Oates with Eddie Kendricks and David Ruffin - Ain\'t Too 28 Proud To Beg 38 Mick Jagger & Tina Turner - State Of Shock 39 Richards & Ron Wood - Blowing In The Wind 40 Patti Labelle - Forever Young 41 Paul McCartney - Let It Be 42 Band Aid Finale - Do They Know It\'s Christmas? (full length)', 'CD', '641e97ed208bf.jpg', 'Band', 'Aid', 'Warner Vision France', 'Warner Bros. Entertainment GmbH Humboldtstraße 62 22083 Hamburg', '2005-06-04', '1'),
(40, 'The Hotel New Hampshire ', '9780345400475', '\"The first of my father\'s illusions was that bears could survive the life lived by human beings, and the second was that human beings could survive a life led in hotels.\"\r\nSo says John Berry, son of a hapless dreamer, brother to a cadre of eccentric siblings, and chronicler of the lives lived, the loves experienced, the deaths met, and the myriad strange and wonderful times encountered by the family Berry. Hoteliers, pet-bear owners, friends of Freud (the animal trainer and vaudevillian, that is), and playthings of mad fate, they \"dream on\" in a funny, sad, outrageous, and moving novel by the remarkable author of A Son of the Circus and A Prayer for Owen Meany.\r\n\"Like Garp, [THE HOTEL NEW HAMPSHIRE] is a startlingly original family saga that combines macabre humor with Dickensian sentiment and outrage at cruelty, dogmatism and injustice.\"\r\n--Time\r\n\"Rejoice! John Irving has written another book according to your world....You must read this book.\"\r\n--Los Angeles Times\r\n\"Spellbinding...Intensely human...A high-wire act of dazzling virtuosity.\"\r\n--Cosmopolitan', 'BOOK', '641e997d0fe9f.jpg', 'John', 'Irwing', 'Ballantine Books; Reissue editio', 'n/a', '2000-10-01', '1'),
(41, 'A Prayer for Owen Meany: A Novel', '978-006220422', 'A remarkable novel. . . . A Prayer for Owen Meany is a rare creation in the somehow exhausted world of late twentieth-century fiction—it is an amazingly brave piece of work . . . so extraordinary, so original, and so enriching. . . . Readers will come to the end feeling sorry to leave [this] richly textured and carefully wrought world.”\r\n   — STEPHEN KING, Washington Post\r\n\r\nA PBS Great American Read Top 100 Pick\r\n\r\nI am doomed to remember a boy with a wrecked voice—not because of his voice, or because he was the smallest person I ever knew, or even because he was the instrument of my mother\'s death, but because he is the reason I believe in God; I am a Christian because of Owen Meany.\r\n\r\nIn the summer of 1953, two eleven-year-old boys—best friends—are playing in a Little League baseball game in Gravesend, New Hampshire. One of the boys hits a foul ball that kills the other boy\'s mother. The boy who hits the ball doesn\'t believe in accidents; Owen Meany believes he is God\'s instrument. What happens to Owen after that 1953 foul ball is extraordinary.\r\n\r\n“Roomy, intelligent, exhilarating, and darkly comic . . . Dickensian in scope . . . Quite stunning and very ambitious.” — Los Angeles Times Book Review\r\n\r\n“Brilliantly cinematic . . . Irving shows considerable skill as scene after scene mounts to its moving climax.\" — ALFRED KAZIN, New York Times', 'BOOK', '641e9a408c6db.jpg', 'John', 'Irwing', 'William Morrow Paperbacks; Repr.', 'n/a', '2012-04-03', '1'),
(42, 'The Hotel New Hampshire', '35217362', 'This novel is the story of the Berrys, a quirky New Hampshire family composed of a married couple, Win and Mary, and their five children, Frank, Franny, John, Lilly, and Egg. The parents, both from the small town of Dairy, New Hampshire (presumably based on Derry, New Hampshire), fall in love while working at a summer resort hotel in Maine as teenagers. There, they meet a Viennese Jew named Freud who works at the resort as a handyman and entertainer, performing with his pet bear, State o\' Maine; Freud comes to symbolize the magic of that summer for them. By summer\'s end, the teens are engaged, and Win buys Freud\'s bear and motorcycle and travels the country performing to raise money to go to Harvard, which he subsequently attends while Mary starts their family. He then returns to Dairy and teaches at the local second-rate boys\' prep school he attended, the Dairy School. But he is unsatisfied and dreaming of something better.\r\n\r\nBrash, self-confident beauty Franny is the object of John\'s adoration. John serves as the narrator, and is sweet, if naive. Frank is physically and socially awkward, reserved, and homosexual; he shares a friendship with his younger sister, Lilly, a romantic young girl who has stopped physically growing. Egg is an immature little boy with a penchant for dressing up in costumes. John and Franny are companions, seeing themselves as the most normal of the children, aware their family is rather strange. But, as John remarks, to themselves the family\'s oddness seems \"right as rain.\"\r\n\r\nWin conceives the idea of turning an abandoned girls\' school into a hotel. He names it the Hotel New Hampshire and the family moves in. This becomes the first part of the Dickensian-style tale. Key plot points include Franny\'s rape at the hands of quarterback Chipper Dove and several of his fellow football teammates. The actions and attitude of Chipper, with whom Franny is in love, are contrasted with those of her rescuer, Junior Jones, a black member of the team. The death of the family dog, Sorrow, provides dark comedy as he is repeatedly \"resurrected\" via taxidermy, first scaring Win\'s father, Iowa Bob, to death and then foiling a sexual initiation of John\'s. John partakes in a continuing sexual/business relationship with the older hotel housekeeper, Ronda Ray, which ends when a letter arrives from Freud in Vienna, inviting the family to move to help him (and his new \"smart\" bear) run his hotel there. \r\nTraveling separately from the rest of the family, Mary and Egg are killed in a plane crash. The others take up life in Vienna at what is renamed the (second) Hotel New Hampshire, one floor of which is occupied by prostitutes and another floor by a group of radical communists. The family discover Freud is now blind and the \"smart bear\" is actually a young woman named Susie, who has endured events which leave her with little fondness for humans and feeling most secure inside a very realistic bear suit. After the death of his wife, Win Berry retreats further into his own hazy, vague fantasy world, while the family navigate relationships with the prostitutes and the radicals. John and Franny experience the pain and desire of being in love with each other. The two also feel jealousy when John becomes romantically involved with a communist who commits suicide, and Franny finds comfort, freedom, and excitement in sexual relationships with both Susie the Bear and Ernst, the \"quarterback\" of the radicals. Lilly develops as a writer and authors a novel based on the family, under whose noses an elaborate plot is being hatched by the radicals to blow up the Vienna opera house, using Freud and the family as hostages, which Freud and Win barely manage to stop. In the process, Freud dies and Win himself is blinded. The family become famous as heroes, and with Frank as Lilly\'s agent, her book is published for a large amount of money. The family (with Susie) returns to the States, taking up residence in The Stanhope hotel in New York.\r\n\r\nIn the final part of the novel, Franny and John find a way to resolve their love, and Franny, with Susie\'s ingenious assistance, finally gets revenge on Chipper. Franny also finds success as a movie actress and marries Junior, now a well-known civil rights lawyer. Lilly is unable to cope with the pressure of her career and her own self-criticism and commits suicide. John and Frank purchase the shut-down resort in Maine where their parents met during the \"magical\" summer, and the property becomes another hotel of sorts, functioning as a rape crisis center run by Susie and with Win providing unwitting counsel to victims. Susie, whose emotional pain and insecurities have healed somewhat with time and effort, builds a happy relationship with John, and a pregnant Franny asks them to raise her and Junior\'s impending baby. ', 'DVD', '641e9b9979ae5.jpg', 'John', 'Irwing', ' Kl Studio Classics', 'n/a', '2016-01-05', '1'),
(43, 'Hair', '9783404014132', 'Hair is a 1979 American musical anti-war comedy-drama film based on the 1968 Broadway musical Hair: The American Tribal Love-Rock Musical. Set against the backdrop of the hippie counterculture of the Vietnam era, the film focuses on a Vietnam War draftee who meets and befriends a \"tribe\" of hippies while en route to the army induction center. The hippies and their leader introduce him to marijuana, LSD and their environment of unorthodox relationships and draft evasion.\r\n\r\nThe film was directed by Miloš Forman (who was nominated for a César Award for his work on the film) and adapted for the screen by Michael Weller (who would collaborate with Forman on a second picture, Ragtime, two years later). Cast members include John Savage, Treat Williams, Beverly D\'Angelo, Annie Golden, Dorsey Wright, Don Dacus, Cheryl Barnes and Ronnie Dyson. Dance scenes were choreographed by Twyla Tharp and were performed by Tharp\'s dancers. The film was nominated for two Golden Globes: Best Motion Picture – Musical or Comedy, and New Star of the Year in a Motion Picture (for Williams). \r\nPlot\r\n\r\nClaude Hooper Bukowski of Oklahoma is sent off to New York City after being drafted into the Army (\"Aquarius\"). Before his draft board-appointment, Claude begins exploring New York, where he encounters a close-knit \"tribe\" of hippies led by George Berger. He observes the hippies panhandle from a trio of horseback riders including Short Hills, New Jersey debutante Sheila Franklin (\"Sodomy\") and later catches and mounts a runaway horse, which the hippies have rented, exhibiting his riding skills to Sheila (\"Donna\") before then returning the horse to Berger, who offers to show him around.\r\n\r\nThat evening, Claude gets stoned on marijuana with Berger and the tribe. He is then introduced to various race and class issues of the 1960s (\"Hashish\", \"Colored Spade\", \"Manchester\", \"I\'m Black/Ain\'t Got No\"). The next morning, Berger finds a newspaper clipping which gives Sheila\'s address in Short Hills, New Jersey. The tribe members—LaFayette \"Hud\" Johnson, Jeannie Ryan (who is pregnant), and \"Woof Dacshund\"—crash a private dinner party to introduce Claude to Sheila, who secretly enjoys her rigid environment being disrupted (\"I Got Life\"). After Berger and company are arrested, Claude uses his last $50 to bail him out of jail—where Woof resists having his hair cut (\"Hair\").\r\n\r\nWhen Sheila is unable to borrow any money from her father, Berger returns to his parents\' home. His mother gives him enough cash to bail out his friends. They subsequently attend a peace rally in Central Park, where Claude drops acid for the first time (\"Initials\", \"Electric Blues/Old Fashioned Melody\", \"Be In\"). Just as Jeannie proposes marriage to Claude, in order to keep him out of the Army, Sheila shows up to apologize. Claude\'s \"trip\" reflects his inner conflict over which of three worlds he fits in with: his own native Oklahoman farm culture, Sheila\'s upper-class society, or the hippies\' free-wheeling environment.\r\n\r\nAfter his acid trip, Claude falls out with Berger and the tribe members, ostensibly due to a practical joke they pull on Sheila (taking her clothes while she\'s skinny-dipping, which forces her to hail a taxi in just her panties), but also due to their philosophical differences over the war in Vietnam—and over personal versus communal responsibility. After wandering the city (\"Where Do I Go?\"), Claude finally reports to the draft board (“Black Boys/White Boys”), completes his enlistment, and is shipped off to Nevada for basic training.\r\n\r\nIt\'s now Winter in New York when Claude writes to Sheila from Nevada (\"Walking In Space\"), who subsequently shares the news with the others. Berger devises a scheme to visit Claude in Nevada. Meanwhile, Hud\'s fiancée—with whom he has a son, LaFayette Jr.—wants to marry as they had apparently planned to earlier (\"Easy To Be Hard\"). The tribe members trick Sheila\'s brother Steve out of his car, then head west to visit Claude.\r\n\r\nArriving at the Army training center where Claude is stationed (\"Three-Five-Zero-Zero\", \"Good Morning Starshine\"), the hippies are turned away, ostensibly because the base is on alert, but also because the MP on duty loathes their appearance, proceeding to condescendingly caricaturize Berger\'s perceived vernacular. Sometime later, Sheila chats up army sergeant Fenton at a local bar, using sex to lure him to an isolated desert road and acquire his uniform. The hippies steal his car, and Berger cuts his hair and dons the uniform (symbolically becoming a responsible adult), then drives it onto the Army base. He finds Claude and offers to replace him for the next headcount so that Claude can meet Sheila and the others for a going-away picnic in the desert.\r\n\r\nUnfortunately, just after a disguised Claude slips away to the picnic, the base becomes fully activated with immediate ship-outs for Vietnam. Berger\'s ruse is never discovered; clearly horrified of potentially joining the war, he is herded onto the plane to be shipped out. Claude returns to the empty barracks and frantically pursues Berger\'s plane but is unable to reach it before it takes off for Southeast Asia (\"The Flesh Failures\").\r\n\r\nMonths later, Claude, Sheila, and the tribe gather around Berger\'s grave in Arlington National Cemetery, whose grave marker shows that he was killed in Vietnam (\"Let the Sunshine In\"). The movie ends with what appears to be a full-scale peace-protest in Washington, D.C. ', 'DVD', '641ed50337e4a.jpg', 'Miloš', 'Forman', 'United Artists', ' 72 NEW CAVENDISH STREET, London, Greater London England, W1G 8AU ', '1979-03-10', '1'),

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
