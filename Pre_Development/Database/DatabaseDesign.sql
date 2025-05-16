

CREATE TABLE `users` (
  `userId` varchar(255) PRIMARY KEY,
  `username` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `isAdmin` boolean
);

CREATE TABLE `categories` (
  `categoryId` varchar(255) PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `products` (
  `productId` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `image` varchar(255),
  `brand` varchar(255),
  `quantity` int,
  `description` text,
  `rating` float,
  `numReviews` int,
  `price` float,
  `countInStock` int,
  `categoryId` varchar(255)
);

CREATE TABLE `reviews` (
  `reviewId` varchar(255) PRIMARY KEY,
  `productId` varchar(255),
  `userId` varchar(255),
  `rating` int,
  `comment` text,
  `createdAt` datetime,
  `updatedAt` datetime
);

CREATE TABLE `orders` (
  `orderId` varchar(255) PRIMARY KEY,
  `userId` varchar(255),
  `paymentMethod` varchar(255),
  `paymentResultId` varchar(255),
  `paymentStatus` varchar(255),
  `paymentUpdateTime` varchar(255),
  `paymentEmail` varchar(255),
  `itemsPrice` float,
  `taxPrice` float,
  `shippingPrice` float,
  `totalPrice` float,
  `isPaid` boolean,
  `paidAt` datetime,
  `isDelivered` boolean,
  `deliveredAt` datetime,
  `shippingAddressId` varchar(255)
);

CREATE TABLE `orderItems` (
  `itemId` varchar(255) PRIMARY KEY,
  `orderId` varchar(255),
  `productId` varchar(255),
  `name` varchar(255),
  `qty` int,
  `image` varchar(255),
  `price` float
);

CREATE TABLE `shippingAddress` (
  `shippingId` varchar(255) PRIMARY KEY,
  `address` varchar(255),
  `city` varchar(255),
  `postalCode` varchar(255),
  `country` varchar(255)
);

ALTER TABLE `products` ADD FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`productId`) REFERENCES `products` (`productId`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

ALTER TABLE `orders` ADD FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

ALTER TABLE `orders` ADD FOREIGN KEY (`shippingAddressId`) REFERENCES `shippingAddress` (`shippingId`);

ALTER TABLE `orderItems` ADD FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`);

ALTER TABLE `orderItems` ADD FOREIGN KEY (`productId`) REFERENCES `products` (`productId`);
