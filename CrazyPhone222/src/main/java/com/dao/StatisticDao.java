package com.dao;

import java.util.List;

public interface StatisticDao {

	List<Object[]> getBrandOccupy();

	List<Object[]> getRevenue();

	List<Object[]> getTopSales();

}
