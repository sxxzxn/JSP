package project;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.List;

public class PrintMemberDB {

	public static void main(String[] args) throws Exception {
		String fileName = "c:\\temp\\member.db";
		File file = new File(fileName);
		ObjectInputStream ois = new ObjectInputStream(new BufferedInputStream(new FileInputStream(file)));
		List<Member> memberList = (List<Member>) ois.readObject();

		memberList.stream().forEach(member -> System.out.println(member));

	}

}
