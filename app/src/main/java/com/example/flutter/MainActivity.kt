package com.example.flutter

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.addItemDecoration(DividerItemDecoration(this,DividerItemDecoration.VERTICAL))

        val data = ArrayList<ItemEntity>()
        data.add(ItemEntity(getString(R.string.test_flutter_native_communication),"router0"))
        data.add(ItemEntity(getString(R.string.flutter_text),"router2"))
        data.add(ItemEntity(getString(R.string.flutter_router),"router3"))
        data.add(ItemEntity(getString(R.string.flutter_text_widget),"router4"))
        data.add(ItemEntity(getString(R.string.flutter_button),"router5"))
        data.add(ItemEntity(getString(R.string.flutter_image),"router6"))
        data.add(ItemEntity(getString(R.string.flutter_checkButton),"router7"))
        data.add(ItemEntity(getString(R.string.flutter_editText),"router8"))
        data.add(ItemEntity(getString(R.string.flutter_progressDialog),"router9"))
        data.add(ItemEntity(getString(R.string.flutter_LinearLayout),"router10"))
        data.add(ItemEntity(getString(R.string.flutter_flexLayout),"router11"))
        data.add(ItemEntity(getString(R.string.flutter_flowLayout),"router12"))
        data.add(ItemEntity(getString(R.string.flutter_stackLayout),"router13"))
        data.add(ItemEntity(getString(R.string.flutter_align),"router14"))

        val adapter = ListItemAdapter(R.layout.item_view,data)
        recyclerView.adapter = adapter

        adapter.setOnItemClickListener { adapter, view, position ->
            val itemEntity = data[position]
            if(itemEntity.router == "router0") {
                startActivity(Intent(this,FlutterMainActivity::class.java))
            } else {
                val intent = Intent(this,FlutterViewActivity::class.java)
                intent.putExtra(MainActivity::class.java.simpleName,itemEntity.router)
                startActivity(intent)
            }
        }
    }

}