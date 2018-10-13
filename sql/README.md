## Database structure

To initialized database
```
dbinit.sql
```

### products
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| name | varchar(50) | |
| color | char(10) | |
| desc | text | |
| gender | char(4) | |

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
| pictureURL | varchar(80) | |

### customers
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| name | varchar(30) | |
| address | varchar(100) | |
| zipCode | int(80) | |
| email | varchar(50) | |
| phone | int(80) | |

### orders
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| customerID | int(10) | FK (`customers.id`) |
| dateOrder | date | |
| productID | int(10) | FK(`products.id`) |
| quantity | int(10) | |
| size | int(2) | |

### review
| Column | Data types | PK / FK |
| ------ | ---------- | ------- |
| id | int(10) | PK |
| customerID | int(10) | FK (`customers.id`) |
| productID | int(10) | FK(`products.id`) |
| productID | text | |
