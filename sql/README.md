## Database structure

To initialized database:
```
Make sure the db name written correctly in dbinit.sql file
```

Then execute these sql file in sequence
```
1. dbinit.sql
2. seed_contacts.sql
3. seed_customers.sql
4. seed_products.sql
5. seed_pictures.sql
6. seed_inventory.sql
7. seed_specifications.sql
8. seed_transactions.sql
9. seed_orders.sql
10. seed_reviews.sql
11. seed_members.sql
```
You can also choose to execute all of the sql file above by copying all files
```
Step to generate all files:
1. If you are on Windows: Open CMD and type the following command:
* copy /b *.sql all files.sql

2. If you are on Mac/Linux: Open terminal and type the following command:
* cat *.sql > all_files.sql
```

### contacts
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(11) | PK |
| firstname | varchar(20) |  |
| lastname | varchar(20) |  |
| email | varchar(50) | |
| message | text | |

### customers
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| salutation | varchar(5) | |
| name | varchar(30) | |
| address | varchar(100)) | |
| email | varchar(50) | |
| phone | varchar(20) | |

### products
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| name | varchar(50) | |
| color | char(10) | |
| desc | text | |
| gender | char(4) | |
| price | int(10) | |

### inventory
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| productID | int(10) | FK (`products.id`) |
| size | int(10) | |
| stock | int(10) | |

### pictures
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| productID | int(10) | FK (`products.id`) |
| pictureURL | varchar(150) | |

### specifications
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| productID | int(10) | FK (`products.id`) |
| specification | text | |

### transactions
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| customerID | int(10) | FK (`customers.id`) |
| firstname | varchar(20) | |
| lastname | varchar(20) | |
| address | text | |
| zipCode | int(6) | |
| phone | varchar(20) | |

### orders
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| transactionID | int(10) | FK (`transactions.id`) |
| productID | int(10) | FK (`products.id`) |
| dateOrder | date | |
| quantity | int(10) | |
| size | int(2) | |

### reviews
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| transactionID | int(10) | FK (`transactions.id`) |
| reviews | text | |

### members
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| email | varchar(50) | |
| password | binary(200)) | |
| customerID | int(10) | FK (`customers.id`) |
