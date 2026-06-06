#### December 22nd


## What is NULL

NULL means nothing, unknown

NULL is not equal to anything!

- NULL is not zero
- NULL is not empty string
- NULL is not blank space

## NULL Functions

### Replace Values

**IFNULL | COALESCE | NULLIF**

### Check for NULLs

**IS NULL | IS NOT NULL**

## IFNULL

Replaces ‘NULL’ with a specified value

- **IFNULL(value, replacement_value)**
- **IFNULL(shipping_address, ‘unknown’)**
- **IFNULL(shipping_address, billing_address),**

#### **IFNULL(shipping_address, billing_address)**


| Ordered | Shipment_address | Billing_address | ISNULL   |
| ------- | ---------------- | --------------- | -------- |
| 1       | A                | B               | **A**    |
| 2       | NULL             | C               | **C**    |
| 3       | NULL             | NULL            | **NULL** |

#### IFNULL Flow

![](../images/Lecture%2018/image%2001%20-%20flowchart%20ifnull.png)

## COALESCE

Returns the first non-null value from a list

- **COALESCE(value1, value2, value3, ….)**
- **COALESCE(shipping_address, ‘unknown’)**
- **COALESCE(shipping_address, billing_address)**
- **COALESCE(shipping_address, billing_address, ‘unknown’)**

#### **COALESCE(shipping_address, billing_address)**

| Ordered | Shipment_address | Billing_address | COALESCE |
| ------- | ---------------- | --------------- | -------- |
| 1       | A                | B               | **A**    |
| 2       | NULL             | C               | **C**    |
| 3       | NULL             | NULL            | **NULL** |

## IFNULL vs COALESCE

| IFNULL                                                   | COALESCE                   |
| -------------------------------------------------------- | -------------------------- |
| Limited to two values                                    | Unlimited                  |
| Fast                                                     | Slow                       |
| SQL Server -> ISNULL<br>ORACLE -> NVL<br>MySQL -> IFNULL | Available in all databases |

#### COALESCE Flow

![](../images/Lecture%2018/image%2002%20-%20flowchart%20coalesce.png)

## Use Case - Handling NULLs

- Handle the NULL before doing data aggregations
- Handle the NULL before doing mathematical operations
- Handle the NULL before JOINING tables
- Handle the NULL before sorting data

## NULLIF

Compares two expressions and returns:

- NULL, if they are equal
- First value, if they are not equal

#### Examples

- **NULLIF(value1, value2)**
- **NULLIF(shipping_address, ‘unknown’)**
- **NULLIF(shipping_address, billing_address)**

### Use Case -NULLIF

Preventing the error of dividing by zero


## IS NULL and IS NOT NULL

**IS NULL:** Returns TRUE if the value IS NULL, otherwise it returns FALSE  
**IS NOT NULL:** Returns TRUE if the value IS NOT NULL, otherwise it returns FALSE

- **Value IS NULL || Value IS NOT NULL**
- **Shipping_address IS NULL**
- **Shipping_address IS NOT NULL**

### Use Case - IS NULL

- Searching for missing information
- Finding the unmatched rows between two tables