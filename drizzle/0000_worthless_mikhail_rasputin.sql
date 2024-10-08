CREATE TABLE `cart` (
	`itemQuantity` int,
	`itemPrice` float,
	`userId` varchar(255) NOT NULL,
	`productId` varchar(255) NOT NULL,
	CONSTRAINT `cart_productId` PRIMARY KEY(`productId`)
);
--> statement-breakpoint
CREATE TABLE `order` (
	`id` varchar(255) NOT NULL,
	`name` varchar(255),
	`email` varchar(255) NOT NULL,
	`password` varchar(255),
	`gender` varchar(10),
	`phone` varchar(15),
	`emailVerified` boolean,
	`image` varchar(255),
	`birtdate` date,
	`verificationToken` int unsigned,
	CONSTRAINT `order_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `labels` (
	`id` int AUTO_INCREMENT NOT NULL,
	`label` varchar(255),
	CONSTRAINT `labels_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `product` (
	`id` varchar(255) NOT NULL,
	`name` varchar(255),
	`price` float NOT NULL,
	`description` varchar(500),
	`availableQuantity` int,
	`totalLikes` int,
	`createdAt` datetime,
	`OwnerId` varchar(255) NOT NULL,
	CONSTRAINT `product_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `product_image` (
	`productId` varchar(255) NOT NULL,
	`image` varchar(255) NOT NULL,
	CONSTRAINT `product_image_productId_image_pk` PRIMARY KEY(`productId`,`image`)
);
--> statement-breakpoint
CREATE TABLE `product_label` (
	`productId` varchar(255) NOT NULL,
	`labelId` int
);
--> statement-breakpoint
CREATE TABLE `product_userLiked` (
	`productId` varchar(255) NOT NULL,
	`userId` varchar(255) NOT NULL,
	`likedAt` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `product_userLiked_productId_userId_pk` PRIMARY KEY(`productId`,`userId`)
);
--> statement-breakpoint
CREATE TABLE `account` (
	`userId` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`provider` varchar(255) NOT NULL,
	`providerAccountId` varchar(255) NOT NULL,
	`refresh_token` varchar(255),
	`access_token` varchar(255),
	`expires_at` int,
	`token_type` varchar(255),
	`scope` varchar(255),
	`id_token` varchar(2048),
	`session_state` varchar(255),
	CONSTRAINT `account_provider_providerAccountId_pk` PRIMARY KEY(`provider`,`providerAccountId`)
);
--> statement-breakpoint
CREATE TABLE `authenticator` (
	`credentialID` varchar(255) NOT NULL,
	`userId` varchar(255) NOT NULL,
	`providerAccountId` varchar(255) NOT NULL,
	`credentialPublicKey` varchar(255) NOT NULL,
	`counter` int NOT NULL,
	`credentialDeviceType` varchar(255) NOT NULL,
	`credentialBackedUp` boolean NOT NULL,
	`transports` varchar(255),
	CONSTRAINT `authenticator_userId_credentialID_pk` PRIMARY KEY(`userId`,`credentialID`),
	CONSTRAINT `authenticator_credentialID_unique` UNIQUE(`credentialID`)
);
--> statement-breakpoint
CREATE TABLE `session` (
	`sessionToken` varchar(255) NOT NULL,
	`userId` varchar(255) NOT NULL,
	`expires` timestamp NOT NULL,
	CONSTRAINT `session_sessionToken` PRIMARY KEY(`sessionToken`)
);
--> statement-breakpoint
CREATE TABLE `shippingAddresses` (
	`userId` varchar(255) NOT NULL,
	`province` varchar(255),
	`address` varchar(255),
	CONSTRAINT `shippingAddresses_userId` PRIMARY KEY(`userId`)
);
--> statement-breakpoint
CREATE TABLE `user` (
	`id` varchar(255) NOT NULL,
	`name` varchar(255),
	`email` varchar(255) NOT NULL,
	`password` varchar(255),
	`gender` varchar(10),
	`phone` varchar(15),
	`emailVerified` boolean,
	`image` varchar(255),
	`role` varchar(50),
	`birthdate` date,
	`verificationToken` int unsigned,
	CONSTRAINT `user_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `verificationToken` (
	`identifier` varchar(255) NOT NULL,
	`token` varchar(255) NOT NULL,
	`expires` timestamp NOT NULL,
	CONSTRAINT `verificationToken_identifier_token_pk` PRIMARY KEY(`identifier`,`token`)
);
--> statement-breakpoint
ALTER TABLE `cart` ADD CONSTRAINT `cart_userId_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `cart` ADD CONSTRAINT `cart_productId_product_id_fk` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product` ADD CONSTRAINT `product_OwnerId_user_id_fk` FOREIGN KEY (`OwnerId`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product_image` ADD CONSTRAINT `product_image_productId_product_id_fk` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product_label` ADD CONSTRAINT `product_label_productId_product_id_fk` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product_userLiked` ADD CONSTRAINT `product_userLiked_productId_product_id_fk` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product_userLiked` ADD CONSTRAINT `product_userLiked_userId_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `account` ADD CONSTRAINT `account_userId_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `authenticator` ADD CONSTRAINT `authenticator_userId_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `session` ADD CONSTRAINT `session_userId_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `shippingAddresses` ADD CONSTRAINT `shippingAddresses_userId_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE cascade ON UPDATE no action;