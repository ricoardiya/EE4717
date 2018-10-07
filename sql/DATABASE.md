## Database structure

**products**
| id | int(10) |
| name | varchar(50) |
| color | char(10) |
| desc | char(40) |
| gender | char(4) |

**inventory**
| id | int(10) |
| productID | int(10) |
| size | int(10) |
| stock | int(10) |

**pictures**
| id | int(10) |
| productID | int(10) |
| pictureURL | varchar(80) |
