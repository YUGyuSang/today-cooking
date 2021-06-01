CREATE TABLE `user` (

  `id` varchar(10) COLLATE utf8_bin NOT NULL,

  `password` varchar(20) COLLATE utf8_bin NOT NULL,

  `email` varchar(45) COLLATE utf8_bin NOT NULL,

  `nickname` varchar(20) COLLATE utf8_bin NOT NULL,

  `profile` longblob,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `recipe` (

  `recipe_id` int(11) NOT NULL,

  `recipe_title` varchar(40) COLLATE utf8_bin NOT NULL,

  `recipe_content` varchar(100) COLLATE utf8_bin NOT NULL,

  `recipe_situation` varchar(20) COLLATE utf8_bin NOT NULL,

  `recipe_ingredient` varchar(20) COLLATE utf8_bin NOT NULL,

  `recipe_thumbnail` varchar(200) COLLATE utf8_bin DEFAULT NULL,

  `user_id` varchar(10) COLLATE utf8_bin NOT NULL,

  `recipe_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  `bookmark_count` int(11) NOT NULL DEFAULT '0',

  PRIMARY KEY (`recipe_id`),

  KEY `fk_id` (`user_id`),

  CONSTRAINT `fk_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `order` (

  `order_id` int(11) NOT NULL AUTO_INCREMENT,

  `order_num` int(11) NOT NULL,

  `order_content` varchar(200) COLLATE utf8_bin NOT NULL,

  `recipe_id` int(11) NOT NULL,

  PRIMARY KEY (`order_id`),

  KEY `recipe_id_idx` (`recipe_id`),

  CONSTRAINT `recipe_id1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `ingredient` (

  `idingredient_id` int(11) NOT NULL AUTO_INCREMENT,

  `ingredient_name` varchar(15) COLLATE utf8_bin NOT NULL,

  `ingredient_amount` varchar(100) COLLATE utf8_bin NOT NULL,

  `recipe_id` int(11) NOT NULL,

  PRIMARY KEY (`idingredient_id`),

  KEY `recipe_id_idx` (`recipe_id`),

  CONSTRAINT `recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `bookmark_outer` (

  `outer_id` int(11) NOT NULL AUTO_INCREMENT,

  `outer_url` varchar(200) COLLATE utf8_bin NOT NULL,

  `outer_title` varchar(200) COLLATE utf8_bin NOT NULL,

  `outer_thumbnail` varchar(800) COLLATE utf8_bin NOT NULL,

  `user_id` varchar(10) COLLATE utf8_bin NOT NULL,

  PRIMARY KEY (`outer_id`),

  KEY `fk_id2` (`user_id`),

  CONSTRAINT `fk_id2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `bookmark_inner` (

  `bookmark_id` int(11) NOT NULL AUTO_INCREMENT,

  `recipe_id` int(11) NOT NULL,

  `user_id` varchar(10) COLLATE utf8_bin NOT NULL,

  PRIMARY KEY (`bookmark_id`),

  KEY `fk12` (`recipe_id`),

  KEY `fk_id1` (`user_id`),

  CONSTRAINT `fk12` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE  ON UPDATE CASCADE,

  CONSTRAINT `fk_id1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;