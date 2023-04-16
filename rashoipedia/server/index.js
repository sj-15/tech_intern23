const express = require('express');
const mysql = require('mysql');

const app = express();
const RecipeDetails = require("./model/recipedetails");

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
    // example query to get recipe name and ingredients
    const query = `
        SELECT *
        FROM recipes r
        JOIN recipe_categories rc ON r.id = rc.recipe_id
        WHERE rc.category_id = ?;
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

// API endpoint to get recipe details for a given recipe ID
app.get('/recipe/:recipeId', async (req, res) => {
    const recipeId = req.params.recipeId;
    const recipeDetails = new RecipeDetails();
    
    try {
        const nutritionsPromise = new Promise((resolve, reject) => {
            connection.query(
                'SELECT quantity FROM recipe_nutritions WHERE recipe_id = ?',
                [recipeId],
                (error, results) => {
                    if (error) {
                        reject(error);
                    } else {
                        const nutritionQuantities = results.map(result => result.quantity);
                        recipeDetails.nutritions = nutritionQuantities;
                        resolve();
                    }
                }
            );
        });
        
        const ingredientsPromise = new Promise((resolve, reject) => {
            connection.query(
                'SELECT name, quantity FROM ingredients WHERE recipe_id = ?',
                [recipeId],
                (error, results) => {
                    if (error) {
                        reject(error);
                    } else {
                        const ingredientList = results.map(result => {
                            return {
                                name: result.name,
                                quantity: result.quantity,
                            };
                        });
                        recipeDetails.ingredients = ingredientList;
                        resolve();
                    }
                }
            );
        });
        
        const instructionsPromise = new Promise((resolve, reject) => {
            connection.query(
                'SELECT instr FROM instructions WHERE recipe_id = ?',
                [recipeId],
                (error, results) => {
                    if (error) {
                        reject(error);
                    } else {
                        const instructions = results.map(result => result.instr);
                        recipeDetails.instructions = instructions;
                        resolve();
                    }
                }
            );
        });
        
        await Promise.all([nutritionsPromise, ingredientsPromise, instructionsPromise]);
        res.send(recipeDetails);
    } catch (error) {
        console.error(error);
        res.status(500).send('Failed to load recipe details');
    }
});



// start server
app.listen(3000, () => {
    console.log('Server started on port 3000');
});
