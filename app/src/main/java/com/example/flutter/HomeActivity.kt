package com.example.flutter

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*

/**
 * Copyright (C)
 *
 * @author : gongcb
 * @date : 2020/8/19 11:33 AM
 * @desc :
 */
class HomeActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.addItemDecoration(DividerItemDecoration(this, DividerItemDecoration.VERTICAL))

        val data = ArrayList<ItemEntity>()
        data.add(ItemEntity(getString(R.string.flutter_book_test),"page0"))

        val adapter = ListItemAdapter(R.layout.item_view,data)
        recyclerView.adapter = adapter

        adapter.setOnItemClickListener { adapter, view, position ->
           when(position) {
               0 -> {
                   startActivity(Intent(this,MainActivity::class.java))
               }
           }
        }
    }

}