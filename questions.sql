SELECT 
    employees.employee_id,
    first_name,
    last_name,
    sale_amount,
    SUM(sale_amount) OVER (
        ORDER BY sale_amount
    ) AS running_total
FROM 
    employees
RIGHT JOIN 
    sales 
USING (employee_id)
ORDER BY
    sales.sale_amount;


SELECT 
    employees.employee_id, 
    employees.department_id, 
    departments.department_name,
    AVG(sale_amount) OVER (
        ORDER BY sale_amount
    ) AS running_average
FROM 
    sales
RIGHT JOIN 
    employees 
USING (employee_id)
RIGHT JOIN 
    departments
ON 
    employees.department_id = departments.department_id
ORDER BY 
    sale_amount;


// you at proecdures 
// you as list 
// 