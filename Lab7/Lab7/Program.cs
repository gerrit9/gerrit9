using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//lab7
//11/10/2024
//01
//prints rows of stars to console depending on what user entered
namespace Lab7
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int starInput;// int declared, this will hold user input
            bool validator = false;//holds whether the validation was sucessful or not
            Console.WriteLine("pick a number");// prompts the user to enter a number
            if (int.TryParse(Console.ReadLine(), out starInput)&& starInput>0)// checks if the value entered is an integer
            {
                validator = true;// confirms that it is true by setting validator to true
            }
            if (validator)// checks if the user input successfully validated
            {
                DisplaySquareOfStars(starInput);//calls a method and gives it the user input value
            }
        }
            public static void DisplaySquareOfStars(int numOfStars)// method that takes an int to make sets of stars based on that amount
        {
            for (int rows = 1; rows <= numOfStars; rows++)//loops through until it is greater then the star number
            {
                for (int stars = 1; stars <= numOfStars; stars++)//loops through until greater then the int given
                {
                    Console.Write("*");//prints out an asterisk special character
                }
                Console.WriteLine();// writes a new line after the row finishes, making for proper spacing
            }
        }
    }
}
