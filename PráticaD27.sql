1:

    SELECT COUNT("endDate") AS currentExperiences 
    FROM experiences;

2:

    SELECT "userId" AS id, 
        COUNT(educations.id) 
    FROM educations
    JOIN users ON users.id = "userId"
    GROUP BY "userId";

3:

    SELECT name AS writer, 
        COUNT(testimonials."writerId") AS "testimonailCount"
    FROM users
    JOIN testimonials ON testimonials."writerId" = users.id
    WHERE users.id = 435
    GROUP BY name

4:

    SELECT MAX(salary) as maximumSalary, 
        roles.name AS role
    FROM jobs
    JOIN roles ON "roleId" = roles.id
    WHERE active = true
    GROUP BY role
