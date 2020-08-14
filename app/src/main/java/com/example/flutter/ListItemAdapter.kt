package com.example.flutter

import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.viewholder.BaseViewHolder

/**
 * Copyright (C)
 *
 * @author : gongcb
 * @date : 2020/8/14 9:15 PM
 * @desc :
 */
internal class ListItemAdapter(
    layoutResId: Int,
    data: List<ItemEntity?>?
) : BaseQuickAdapter<ItemEntity?, BaseViewHolder>(layoutResId, data as MutableList<ItemEntity?>?) {

    override fun convert(
        baseViewHolder: BaseViewHolder,
        itemEntity: ItemEntity?
    ) {
        baseViewHolder.setText(R.id.button,itemEntity?.name)
    }
}