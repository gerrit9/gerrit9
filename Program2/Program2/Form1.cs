using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//Program2 
//10/17/2024
//01
// calculates total score on an exercise with values given from user 
namespace Program2
{
    public partial class Program2 : Form
    {
        public Program2()
        {
            InitializeComponent();


        }

        private void label1_Click(object sender, EventArgs e)
        {
            
        }

        private void actualName_TextChanged(object sender, EventArgs e)
        {

        }

        private void exerciseNum_TextChanged(object sender, EventArgs e)
        {

        }

        private void scoreCalculate_Click(object sender, EventArgs e)
        {
            const int timePenalty = 5; // intiates and declares a constant
            string userName;// declares a string
            int exerciseID;// declares a few ints
            int timeSpent;
            int actualScore = 0;// intiates int and sets value
            const int tooEasy = 100; //constant value which keeps track of the starting score for easy difficulty
            const int tooSimple = 200;//constant value which keeps track of the starting score for medium difficulty
            const int tooHard = 300;//constant value which keeps track of the starting score for hard difficulty
            const int veryHard = 400;//constant value which keeps track of the starting score for very hard difficulty
            const double scoreBonus = 0.10;// constant for the score bonus added if there is an actual interview question
            if (string.IsNullOrEmpty(actualName.Text))// checks if the name is blank or null
            {
                MessageBox.Show("Please enter username.");// prompts user to enter a username
            }
            else // when it actually has a value
            {
                userName = actualName.Text; //sets username string to the text entered in the textbox next to the label Username:
            }
            if (int.TryParse(exerciseNum.Text, out exerciseID)) // checks  if the exercise number is actually an int 
            {
                if (exerciseID <= 1000 && exerciseID >= 1) // checks if the exercise num is in range
                {

                }
                else // for when it isn't in range of the numbers
                {
                    MessageBox.Show("Please enter a valid exercise number."); //prompts user to enter a exercise number
                }
            }
            else // when the amount entered isn't an int or doesn't have anything in it
            {
                MessageBox.Show("Please enter a valid exercise number."); // same as line 65
            }
            if (hardChoice.SelectedIndex >= 0) //checks that an option from the list has been selecte
            {
                if (hardChoice.SelectedIndex == 0) // checks if it is the first option, easy mode
                {
                    actualScore = tooEasy; // sets the actual score to the value of 100 
                }
                else if (hardChoice.SelectedIndex == 1) // checks if the second option, medium was selected
                {
                    actualScore = tooSimple; // sets the actual score to the value of 200
                }
                else if (hardChoice.SelectedIndex == 2) // checks if the third option, hard was selected
                {
                    actualScore = tooHard; // sets the actual score to the value of 300
                }
                else if (hardChoice.SelectedIndex == 3) // checks if the fourth and final option, very hard was selected
                {
                    actualScore = veryHard; //sets the actual score to the value of 400
                }
            }
            else // for when no difficulty was selected
            {
                MessageBox.Show("Please select difficulty.");
            }
            if (int.TryParse(lengthofTime.Text, out timeSpent)) // checks if the amount entered in time spent is a valid int
            {
                actualScore= actualScore - timeSpent*timePenalty; // sets the value of actual score to actual score - the amount entered in time spent multiplied by the penalty
            }
            else // for when no amount was entered
            {
                MessageBox.Show("Please enter amount of time spent in minutes"); // prompts the user to fill out time spent textbox
            }
            if (yeah.Checked) // checks if yes was checked
            {
                actualScore = (int)(actualScore + actualScore * scoreBonus); // adds the bonus to actual score and converts the score bonus double to int
                scoreUp.Text = ($"{actualScore}"); //sets score outputlabel text to the actual score value
            }
            else if (nope.Checked) // checks if no was checked
            {
                scoreUp.Text = ($"{actualScore}"); // sets score output to actual score value
            }
            else // for when nothing was entered
            {
                MessageBox.Show("please select whether it is an actual interview question or not(yes or no)"); // prompts user to select an option from the two choices
            }

        }
    }
}
