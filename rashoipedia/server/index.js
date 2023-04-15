const express = require('express');
const mysql = require('mysql');

const app = express();

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
    if (err) {
        console.log(err);
        return;
    }
    console.log('Connected to MySQL database');
});

// API endpoint to get recipe names for a given category
app.get('/recipes/:categoryId', (req, res) => {
    const categoryId = req.params.categoryId;
    console.log(categoryId);
    // example query to get recipe name and ingredients
    const query = `
        SELECT *
        FROM recipes r
        JOIN recipe_categories rc ON r.id = rc.recipe_id
        WHERE rc.category_id = ${categoryId};
    `;

    // execute query with categoryId as a parameter
    connection.query(query, [categoryId], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send('Error fetching recipes');
            return;
        }
        res.send(results);
    });
});

// start server
app.listen(3000, () => {
    console.log('Server started on port 3000');
});
