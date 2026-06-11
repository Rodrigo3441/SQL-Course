#### June 11th



## Database Challenges

- Redundancy
- Performance issues
- Complexity
- Hard to Maintain
- DB Stress
- Security

## Comparing the 5 SQL techniques


|                          | Subquery                      | CTE                            | CTAS                                  | Temp Table        | View              |
| ------------------------ | ----------------------------- | ------------------------------ | ------------------------------------- | ----------------- | ----------------- |
| **Storage**                  | Memory                        | Memory                         | Hard Disc                             | Hard Disc         | No Storage        |
| **Life Time**                | Temporary                     | Temporary                      | Temporary                             | Permanent         | Permanent         |
| **When they<br>get deleted** | End of Query                  | End of Query                   | End of Session                        | DDL-drop          | DDL-drop          |
| **Scope**                    | Single Query                  | Single Query                   | Multi-Queries                         | Multi-Queries     | Multi-Queries     |
| **Reusability**              | Limited<br>1 place<br>1 query | Limited<br>N places<br>1 Query | Medium<br>N queries<br>During session | High<br>N queries | High<br>N queries |
| **Up2Date**                  | Yes                           | Yes                            | No                                    | No                | Yes               |

## SQL Project - Big Picture

![](../images/Lecture%2032/image%2001%20-%20sql%20project%20-%20big%20picture.png)

