const mysql = require('mysql');

// create connection to MySQL database
const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    port: 3306,
    password: '',
    database: 'rashoipedia'
});

// connect to database
connection.connect((err) => {
    if (err){
        console.log(err);
        return;
    }
    console.log('Connected to MySQL database');
});

// example query to get recipe name and ingredients
const query = `
SELECT *
FROM recipes
JOIN recipe_category ON recipes.id = recipe_category.recipe_id
WHERE recipe_category.category_id = 6
`;

// execute query
connection.query(query, (err, results) => {
    if (err)
    {
        console.log(err);
        return;
    }
    console.log(results);
});

// close connection
connection.end();
