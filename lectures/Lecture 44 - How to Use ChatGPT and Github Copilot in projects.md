#### June 18th



## When to Use ChatGPT x GitHub Copilot

| ChatGPT                          | GitHub Copilot             |
| -------------------------------- | -------------------------- |
| Brainstorming and Ideas          | Coding Assistance          |
| Project Planning                 | Debugging                  |
| Learning, Knowledge and Research | Refactoring                |
| Generate Documentations          | Inline Comments            |
| Discussing Architecture          | Styling and Formating Code |
| Exploring Best Practices         |                            |
| Complex Problem-Solving          |                            |

## ChatGPT Prompt - 6x Components

### Tasks

Provide details about what the AI should do
### Context

Provide details about your situation or problem

### Specifications

Go in details, small things you expect from the AI

### Role

"To act as", make the AI behave as an expected way

### Tone

How the AI should answer you back

### Example Prompt

#### Wrong Way

Explain SQL Window Functions

#### Correct Way

You are a senior SQL expert **\[Role]**, and I am a data analyst working on an SQL project using SQL Server **\[Context]**.

Explain the concept of SQL Window Functions and do the following: **\[task]**

- Explain each Window Function and show the Syntax
- Describe why they are important and when to use them
- List the top 3 use cases **\[specifications]**

The tone should be conversational and direct, as if you're speaking to me one-on-one **\[tone]**

## For Developers - 11x Top Prompts

### #1 Solve an SQL Task

In my SQL Server database, we have two tables:

The first table is `orders` with the following columns: order_id, sales, customer_id, product_id.
The second table is `customers` with the following columns: customer_id, first_name, last_name, country.

Do the following:
- Write a query to rank customers based on their sales.
- The result should include the customer's customer_id, full name, country, total sales, and their rank. Include comments but avoid commenting on obvious parts.
- Write three different versions of the query to achieve this task.
- Evaluate and explain which version is best in terms of readability and performance


### #2 improve the Readability

The following SQL Server query is long and hard to understand.

Do the following:
- Improve its readability.
- Remove any redundancy in the query and consolidate it.
- Include comments but avoid commenting on obvious parts.
- Explain each improvement to understand the reasoning behind it. 

\[ SQL Query GOES HERE ]


### #3 Optimize the Performance Query

The following SQL Server query is slow.

Do the following:
- Propose optimizations to improve its performance
- Provide the improve SQL query
- Explain each improvement to understand the reasoning behind it

\[ SQL Query GOES HERE ]


### #4 Optimize Execution Plain
The image is the execution plan of SQL Server query.

Do the following:
- Describe the execution plan step by step.
- Identify performance bottlenecks and issues.
- Suggest ways to improve performance and optimize the execution plan.

\[ SQL Query GOES HERE ]


### #5 Debugging

The following SQL Server Query causing this error: \[Error Message GOES HERE]

Do the following:
- Explain the error massage.
- Find the root cause of the issue.
- Suggest how to fix it.

\[ SQL Query GOES HERE ]

### #6 Explain the Result

I didn't understand the result of the following SQL Server query.

Do the following:
- Break down how SQL processes the query step by step.
- Explaining each stage and how the result is formed.

\[ SQL Query GOES HERE ]

### #7 Styling and Formatting

The following SQL Server query hard to understand.

Do the following:
- Restyle the code to make it easier to read.
- Align column aliases.
- Keep it compact - do not introduce unnecessary new lines.
- Ensure the formatting follows best practices.

\[ SQL Query GOES HERE ]

### #8 Documentations and Comments

The following SQL Server query lacks comments and documentation.

Do the following:
- Insert a leading comment at the start of the query describing its overall purpose.
- Add comments only where clarification is necessary, avoiding obvious statements. Create a separate document explaining the business rules implemented by the query. Create another separate document describing how the query works.

\[ SQL Query GOES HERE ]

### #9 Improve Database DDL

The following SQL Server DDL Script has to be optimized.

Do the following:
- **Naming:** Check the consistency of table/column names, prefixes, standards.
- **Data Types:** Ensure data types are appropriate and optimized.
- **Integrity:** Verify the integrity of primary keys and foreign keys.
- **Indexes:** Check that indexes are sufficient and avoid redundancy.
- **Normalization:** Ensure proper normalization and avoid redundancy.

\[ SQL DDL GOES HERE ]

### #10 Generate Test Dataset

I need dataset for testing the following SQL Server DDL

Do the following:
- Generate test dataset as Insert statements.
- Dataset should be realistic.
- Keep the dataset small.
- Ensure all primary/foreign key relationships are valid (use matching IDs).
- Don't introduce any Null values.
 
\[ SQL DDL GOES HERE ]


## For Learning - 5x Top Prompts
### #11 Create SQL Course

Create a comprehensive SQL course with a detailed roadmap and agenda.

Do the following:
- Start with SQL fundamentals and advance to complex topics.
- Make it beginner-friendly.
- Include topics relevant to data analytics.
- Focus on real-world data analytics use cases and scenarios.

### #12 Understand SQL Concepts

I want detailed explanation about SQL Window Functions.

Do the following:
- Explain what Window Functions are.
- Give an analogy.
- Describe why we need them and when to use them.
- Explain the syntax.
- Provide simple examples.
- List the top 3 use cases.

### #13 Comparing SQL Concepts

I want to understand the differences between SQL Window Functions and GROUP BY.

Do the following:
- Explain the key differences between the two concepts.
- Describe when to use each concept, with examples.
- Provide the pros and cons of each concept.
- Summarize the comparison in a clear side-by-side table.

### #14 Practice SQL

Act as an SQL trainer and help me practice SQL Window Functions.

Do the following:
- Make it interactive Practicing, you provide task and give solution.
- Provide a sample dataset.
- Give SQL tasks that gradually increase in difficulty.
- Act as an SQL Server and show the results of my queries.
- Review my queries, provide feedback, and suggest improvements.

### #15 Prepare for an SQL Interview

Act as Interviewer and prepare me for a SQL interview.

Do the following:
- Ask common SQL interview questions.
- Make it interactive Practicing, you provide question and give answer.
- Gradually progress to advanced topics.
- Evaluate my answer and give me a feedback.