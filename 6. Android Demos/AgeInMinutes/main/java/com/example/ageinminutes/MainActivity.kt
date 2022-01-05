package com.example.ageinminutes

// From a tutorial by tutorials.eu
// https://youtu.be/HwoxgUPabMk


import android.app.DatePickerDialog
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import java.text.SimpleDateFormat
import java.util.*

class MainActivity : AppCompatActivity() {

    private var tvSelectedDate: TextView? = null
    private var tvAgeInMinutes: TextView? = null



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val buttonDatePicker: Button = findViewById(R.id.buttonDatePicker)

        tvSelectedDate = findViewById(R.id.tvSelectedDate)
        tvAgeInMinutes = findViewById(R.id.tvAgeInMinutes)

        buttonDatePicker.setOnClickListener {
           clickDatePicker()
        }

    }

    private fun clickDatePicker() {

        val calendarObject = Calendar.getInstance()
        val year = calendarObject.get(Calendar.YEAR)
        val month = calendarObject.get(Calendar.MONTH)
        val day = calendarObject.get(Calendar.DAY_OF_MONTH)

        val datePickerDialog = DatePickerDialog(this, { _, selectedYear, selectedMonth, selectedDay ->

            // Months start at 0 but days start at 1..

            val selectedDate = "$selectedDay/${selectedMonth+1}/$selectedYear"

            // Old way of setting text
            // textViewSelectedDate?.setText(selectedDate)
            tvSelectedDate?.text = selectedDate   // New way

            val sdf = SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH)
            val theDate = sdf.parse(selectedDate)

            // Only do the following block if the date is not null (unwrapping)
            theDate?.let {
                // getTime() returns the number of milliseconds since Jan 1st 1970
                // So divide by 1000 to get seconds, and 60 for minutes
                val selectedDateInMinutes = theDate.time / 60_000

                val currentDate = sdf.parse(sdf.format(System.currentTimeMillis()))
                currentDate?.let {
                    val currentDateInMinutes = currentDate.time / 60_000

                    val differenceInMinutes = currentDateInMinutes - selectedDateInMinutes

                    tvAgeInMinutes?.text = differenceInMinutes.toString()
                }
            }
        },
            year,
            month,
            day
        )

        // Only allow choosing of dates in the past
        datePickerDialog.datePicker.maxDate = System.currentTimeMillis() - 86_400_000
        datePickerDialog.show()

    }
}