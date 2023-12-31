// This file was auto-generated by ML.NET Model Builder. 

using System;
using Kitabe2ML.Model;

namespace Kitabe2ML.ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create single instance of sample data from first line of dataset for model input
            ModelInput sampleData = new ModelInput()
            {
                Id = 314F,
                R_Id = 1F,
            };

            // Make a single prediction on the sample data and print results
            var predictionResult = ConsumeModel.Predict(sampleData);

            Console.WriteLine("Using model to make single prediction -- Comparing actual Rating with predicted Rating from sample data...\n\n");
            Console.WriteLine($"Id: {sampleData.Id}");
            Console.WriteLine($"R_Id: {sampleData.R_Id}");
            Console.WriteLine($"\n\nPredicted Rating: {predictionResult.Score}\n\n");
            Console.WriteLine("=============== End of process, hit any key to finish ===============");
            Console.ReadKey();
        }
    }
}
