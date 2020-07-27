package com._init;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.model.BrandBean;
import com.model.ProductBean;
import com.model.SpecBean;
import com.model.TypeBean;


// 本程式建立範例程式所需要的表格與部分表格的初始資料
// 範例程式所需要的表格如下：
// 
public class EDMTableResetHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {
//        SessionFactory factory = HibernateUtils.getSessionFactory();
        Transaction tx = null;
		String line = "";
		int count = 0;
		String path = "src\\main\\webapp\\webPhone\\applicationContext.xml";
		ApplicationContext ctx = new FileSystemXmlApplicationContext(path);
		SessionFactory factory = (SessionFactory) ctx.getBean("sessionFactory");
		Session session = factory.openSession();
	
		try  {
			tx = session.beginTransaction();
	//=====================		
			// 2. BookCompany表格
			// 2-2 由"data/bookCompany.dat"逐筆讀入BookCompany表格內的初始資料，
			// 然後依序新增到BookCompany表格中
//			try (
//				FileReader fr = new FileReader("data/bookCompany.dat"); 
//				BufferedReader br = new BufferedReader(fr);
//			) {
//				while ((line = br.readLine()) != null) {
//					if (line.startsWith(UTF8_BOM)) {
//						line = line.substring(1);
//					}
//					String[] token = line.split("\\|");
//					String name = token[0];
//					String address = token[1];
//					String url = token[2];
//					CompanyBean cb = new CompanyBean(null, name, address, url);
//					session.save(cb);
//				}
//				System.out.println("BookCompany 資料新增成功");
//			} catch (IOException e) {
//				System.err.println("新建BookCompany表格時發生IO例外: " + e.getMessage());
//			}
//			
			//=========================================
			try (FileReader fr = new FileReader("data/Type_0709_2.txt"); BufferedReader br = new BufferedReader(fr);) {
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split(",");
					
					TypeBean tb = new TypeBean();
					
					tb.setTypeName(token[0]);
					session.save(tb);
					
					
				}
				System.out.println("type 資料新增成功");
			} catch (IOException e) {
				System.err.println("新建type表格時發生IO例外: " + e.getMessage());
			}			
//==========================================================================================
			try (FileReader fr = new FileReader("data/Brand_0709_2.dat"); BufferedReader br = new BufferedReader(fr);) {
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split(",");
					
					BrandBean bb = new BrandBean();
					
					bb.setBrandName(token[0]);
					bb.setBrandInfo(token[1]);
					bb.setBrandCountry(token[2]);
					session.save(bb);
					
					
				}
				System.out.println("type 資料新增成功");
			} catch (IOException e) {
				System.err.println("新建type表格時發生IO例外: " + e.getMessage());
			}		
			//================			
			// 1. Book表格
			File file = new File("data/Product_0714_2.dat");
			// 1-2 由"data/book.dat"逐筆讀入Book表格內的初始資料，然後依序新增
			// 到Book表格中
			try (FileInputStream fis = new FileInputStream(file);
				 InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				 BufferedReader br = new BufferedReader(isr);
			) {
				while ((line = br.readLine()) != null) {
					System.out.println("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\,");
					ProductBean product = new ProductBean();
				
					@SuppressWarnings("unused")
					int  BrandID =Integer.parseInt(token[0].trim());
					BrandBean bb = session.get(BrandBean.class, BrandID);
					product.setBrandBean(bb);
					@SuppressWarnings("unused")
					int  TypeID =Integer.parseInt(token[1].trim());
					TypeBean tb = session.get(TypeBean.class, TypeID);
					product.setTypeBean(tb);
					
//					product.setBrandBean(Integer.parseInt(token[0].trim()));
//					product.setTypeBean(Integer.parseInt(token[1].trim()));
					
					product.setProductName(token[2]);	
//					int companyId = Integer.parseInt(token[4].trim());
//					CompanyBean cb = session.get(CompanyBean.class, companyId);
//					book.setCompanyBean(cb);
					// 讀取圖片檔
					Blob blob = GlobalService.fileToBlob(token[3].trim());
					product.setProductImage(blob);
					product.setProductIntro(token[4]);
					product.setUnitPrice(Integer.parseInt(token[5].trim()));
					product.setReleasedDate(Timestamp.valueOf(token[6]));
					product.setStockQuantity(Integer.parseInt(token[7].trim()));
					product.setProductFileName(token[8].trim());
					Blob blob2 = GlobalService.fileToBlob(token[9].trim());
					product.setProductImage2(blob2);
					product.setProductFileName2(token[10].trim());
					Blob blob3 = GlobalService.fileToBlob(token[11].trim());
					product.setProductImage3(blob3);
					product.setProductFileName3(token[12].trim());
					
									
					session.save(product);
					System.out.println("新增一筆product紀錄成功");
				}
				// 印出資料新增成功的訊息
				System.out.println("product資料新增成功");
			}
			// 2-aaaaaaa. BookCompany表格
			
			// 2-2 由"data/bookCompany.dat"逐筆讀入BookCompany表格內的初始資料，
			// 然後依序新增到BookCompany表格中
			try (FileReader fr = new FileReader("data/Spec_0727_2.txt"); BufferedReader br = new BufferedReader(fr);) {
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split(",");
					
					SpecBean sb = new SpecBean();

					sb.setOS(token[0]);
					sb.setProcessor(token[1]);
					sb.setDisplaySize(token[2]);
					sb.setDisplayResolution(token[3]);
					sb.setFrontCamera(token[4]);
					sb.setRearCamera(token[5]);
					sb.setRAM(token[6]);
					sb.setStorage(token[7]);
					sb.setBatteryCapacity(token[8]);
					int productID = Integer.parseInt(token[9].trim());
					ProductBean pb = session.get(ProductBean.class, productID);
					sb.setProductBean(pb);
					session.save(sb);
					
				
					
				}
				System.out.println("spec 資料新增成功");
			} catch (IOException e) {
				System.err.println("新建spec表格時發生IO例外: " + e.getMessage());
			}			



//=================================================================================		
			// 3. Member表格
			// 3-2 由"data/Input.txt"逐筆讀入Member表格內的初始資料，
			// 然後依序新增到Member表格中
			
			
			
		} catch (SQLException e) {
			System.err.println("新建表格時發生SQL例外: " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("新建表格時發生IO例外: " + e.getMessage());
		} catch(Exception ex) {
			ex.printStackTrace();
			if ( tx != null) {
				tx.rollback();
			}
		}
		tx.commit();
	}

//	public static int saveBook(BookBean bean, Connection con) {
//		int n = 0;
//		String sqlS = "INSERT INTO Book " + " (title,  author,  listPrice, discount, "
//				+ " companyId, fileName, bookNo, coverImage, stock, category) "
//				+ " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
//		try (PreparedStatement pStmt = con.prepareStatement(sqlS);) {
//			pStmt.setString(1, bean.getTitle());
//			pStmt.setString(2, bean.getAuthor());
//			pStmt.setDouble(3, bean.getListPrice());
//			pStmt.setDouble(4, bean.getDiscount());
//			pStmt.setInt(5, bean.getCompanyId());
//			pStmt.setString(6, bean.getFileName());
//			pStmt.setString(7, bean.getBookNo());
//			pStmt.setBlob(8, bean.getCoverImage());
//			pStmt.setInt(9, bean.getStock());
//			pStmt.setString(10, bean.getCategory());
//			n = pStmt.executeUpdate();
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//		return n;
//	}
//
//	static public int saveCompany(CompanyBean cb, Connection con) {
//		String sqlS = "INSERT INTO BookCompany (name, address, url) VALUES(?, ?, ?)";
//		int n = 0;
//		try (
//			PreparedStatement ps = con.prepareStatement(sqlS);
//		) {
//			ps.setString(1, cb.getName());
//			ps.setString(2, cb.getAddress());
//			ps.setString(3, cb.getUrl());
//			n = ps.executeUpdate();
//
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//		return n;
//	}
//
//	static public int saveMember(MemberBean mb, Connection con) {
//		String sql = "insert into Member " + " (memberId, name, password, address, email, "
//				+ " tel, userType, registerTime, totalAmt, memberImage," + " fileName, comment, unpaid_amount) "
//				+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//		int n = 0;
//		try (
//			PreparedStatement ps = con.prepareStatement(sql);
//		) {
//			ps.setString(1, mb.getMemberId());
//			ps.setString(2, mb.getName());
//			ps.setString(3, mb.getPassword());
//			ps.setString(4, mb.getAddress());
//			ps.setString(5, mb.getEmail());
//			ps.setString(6, mb.getTel());
//			ps.setString(7, mb.getUserType());
//			java.sql.Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
//			ps.setTimestamp(8, now);
//			ps.setDouble(9, mb.getTotalAmt());
//			ps.setBlob(10, mb.getMemberImage());
//			ps.setString(11, mb.getFileName());
//			ps.setClob(12, mb.getComment());
//			ps.setDouble(13, mb.getUnpaid_amount());
//			n = ps.executeUpdate();
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//		return n;
//	}
}