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
