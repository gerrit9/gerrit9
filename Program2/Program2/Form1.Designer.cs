namespace Program2
{
    partial class Program2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.codeQuest = new System.Windows.Forms.Label();
            this.username = new System.Windows.Forms.Label();
            this.exerciseLabel = new System.Windows.Forms.Label();
            this.challengeLevel = new System.Windows.Forms.Label();
            this.timeSpent = new System.Windows.Forms.Label();
            this.actualInterview = new System.Windows.Forms.Label();
            this.exerciseNum = new System.Windows.Forms.TextBox();
            this.actualName = new System.Windows.Forms.TextBox();
            this.nope = new System.Windows.Forms.RadioButton();
            this.hardChoice = new System.Windows.Forms.ComboBox();
            this.yeah = new System.Windows.Forms.RadioButton();
            this.scoreCalculate = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.scoreUp = new System.Windows.Forms.Label();
            this.lengthofTime = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // codeQuest
            // 
            this.codeQuest.AutoSize = true;
            this.codeQuest.Font = new System.Drawing.Font("Arial", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.codeQuest.Location = new System.Drawing.Point(315, 59);
            this.codeQuest.Name = "codeQuest";
            this.codeQuest.Size = new System.Drawing.Size(195, 37);
            this.codeQuest.TabIndex = 0;
            this.codeQuest.Text = "Code Quest";
            this.codeQuest.Click += new System.EventHandler(this.label1_Click);
            // 
            // username
            // 
            this.username.AutoSize = true;
            this.username.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.username.Location = new System.Drawing.Point(277, 133);
            this.username.Name = "username";
            this.username.Size = new System.Drawing.Size(81, 18);
            this.username.TabIndex = 1;
            this.username.Text = "Username:";
            // 
            // exerciseLabel
            // 
            this.exerciseLabel.AutoSize = true;
            this.exerciseLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.exerciseLabel.Location = new System.Drawing.Point(225, 176);
            this.exerciseLabel.Name = "exerciseLabel";
            this.exerciseLabel.Size = new System.Drawing.Size(133, 20);
            this.exerciseLabel.TabIndex = 2;
            this.exerciseLabel.Text = "Exercise Number:";
            // 
            // challengeLevel
            // 
            this.challengeLevel.AutoSize = true;
            this.challengeLevel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.challengeLevel.Location = new System.Drawing.Point(276, 210);
            this.challengeLevel.Name = "challengeLevel";
            this.challengeLevel.Size = new System.Drawing.Size(73, 20);
            this.challengeLevel.TabIndex = 3;
            this.challengeLevel.Text = "Difficulty:";
            // 
            // timeSpent
            // 
            this.timeSpent.AutoSize = true;
            this.timeSpent.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.timeSpent.Location = new System.Drawing.Point(265, 239);
            this.timeSpent.Name = "timeSpent";
            this.timeSpent.Size = new System.Drawing.Size(94, 20);
            this.timeSpent.TabIndex = 4;
            this.timeSpent.Text = "Time Spent:";
            // 
            // actualInterview
            // 
            this.actualInterview.AutoSize = true;
            this.actualInterview.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.actualInterview.Location = new System.Drawing.Point(318, 275);
            this.actualInterview.Name = "actualInterview";
            this.actualInterview.Size = new System.Drawing.Size(189, 20);
            this.actualInterview.TabIndex = 6;
            this.actualInterview.Text = "Actual Interview Question";
            // 
            // exerciseNum
            // 
            this.exerciseNum.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.exerciseNum.Location = new System.Drawing.Point(364, 174);
            this.exerciseNum.Name = "exerciseNum";
            this.exerciseNum.Size = new System.Drawing.Size(100, 22);
            this.exerciseNum.TabIndex = 7;
            this.exerciseNum.TextChanged += new System.EventHandler(this.exerciseNum_TextChanged);
            // 
            // actualName
            // 
            this.actualName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.actualName.Location = new System.Drawing.Point(364, 133);
            this.actualName.Name = "actualName";
            this.actualName.Size = new System.Drawing.Size(100, 22);
            this.actualName.TabIndex = 8;
            this.actualName.TextChanged += new System.EventHandler(this.actualName_TextChanged);
            // 
            // nope
            // 
            this.nope.AutoSize = true;
            this.nope.Location = new System.Drawing.Point(456, 298);
            this.nope.Name = "nope";
            this.nope.Size = new System.Drawing.Size(39, 17);
            this.nope.TabIndex = 9;
            this.nope.TabStop = true;
            this.nope.Text = "No";
            this.nope.UseVisualStyleBackColor = true;
            // 
            // hardChoice
            // 
            this.hardChoice.FormattingEnabled = true;
            this.hardChoice.Items.AddRange(new object[] {
            "Easy",
            "Medium",
            "Hard",
            "Very Hard"});
            this.hardChoice.Location = new System.Drawing.Point(355, 212);
            this.hardChoice.Name = "hardChoice";
            this.hardChoice.Size = new System.Drawing.Size(121, 21);
            this.hardChoice.TabIndex = 10;
            // 
            // yeah
            // 
            this.yeah.AutoSize = true;
            this.yeah.Location = new System.Drawing.Point(322, 298);
            this.yeah.Name = "yeah";
            this.yeah.Size = new System.Drawing.Size(43, 17);
            this.yeah.TabIndex = 11;
            this.yeah.TabStop = true;
            this.yeah.Text = "Yes";
            this.yeah.UseVisualStyleBackColor = true;
            // 
            // scoreCalculate
            // 
            this.scoreCalculate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.scoreCalculate.Location = new System.Drawing.Point(352, 321);
            this.scoreCalculate.Name = "scoreCalculate";
            this.scoreCalculate.Size = new System.Drawing.Size(112, 55);
            this.scoreCalculate.TabIndex = 12;
            this.scoreCalculate.Text = "Calculate Score";
            this.scoreCalculate.UseVisualStyleBackColor = true;
            this.scoreCalculate.Click += new System.EventHandler(this.scoreCalculate_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(299, 379);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(93, 20);
            this.label1.TabIndex = 13;
            this.label1.Text = "Your Score:";
            // 
            // scoreUp
            // 
            this.scoreUp.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.scoreUp.Location = new System.Drawing.Point(365, 408);
            this.scoreUp.Name = "scoreUp";
            this.scoreUp.Size = new System.Drawing.Size(100, 23);
            this.scoreUp.TabIndex = 14;
            // 
            // lengthofTime
            // 
            this.lengthofTime.Location = new System.Drawing.Point(365, 241);
            this.lengthofTime.Name = "lengthofTime";
            this.lengthofTime.Size = new System.Drawing.Size(100, 20);
            this.lengthofTime.TabIndex = 15;
            // 
            // Program2
            // 
            this.AcceptButton = this.scoreCalculate;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.lengthofTime);
            this.Controls.Add(this.scoreUp);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.scoreCalculate);
            this.Controls.Add(this.yeah);
            this.Controls.Add(this.hardChoice);
            this.Controls.Add(this.nope);
            this.Controls.Add(this.actualName);
            this.Controls.Add(this.exerciseNum);
            this.Controls.Add(this.actualInterview);
            this.Controls.Add(this.timeSpent);
            this.Controls.Add(this.challengeLevel);
            this.Controls.Add(this.exerciseLabel);
            this.Controls.Add(this.username);
            this.Controls.Add(this.codeQuest);
            this.Name = "Program2";
            this.Text = "Program2";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label codeQuest;
        private System.Windows.Forms.Label username;
        private System.Windows.Forms.Label exerciseLabel;
        private System.Windows.Forms.Label challengeLevel;
        private System.Windows.Forms.Label timeSpent;
        private System.Windows.Forms.Label actualInterview;
        private System.Windows.Forms.TextBox exerciseNum;
        private System.Windows.Forms.TextBox actualName;
        private System.Windows.Forms.RadioButton nope;
        private System.Windows.Forms.ComboBox hardChoice;
        private System.Windows.Forms.RadioButton yeah;
        private System.Windows.Forms.Button scoreCalculate;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label scoreUp;
        private System.Windows.Forms.TextBox lengthofTime;
    }
}

