package com.DAO;

import java.util.List;

import com.entity.Category;
import com.entity.Slots;

public interface SlotDAO {
    public boolean addSlot(Slots s);
    public Slots getSlotByName(String slotName);
    public Slots getSlotById(int id);  
    public List<Slots> getAllSlots();
    public List<Slots> getAllSlots(int offset, int limit);
    public int getSlotCount();
    List<Slots> getAllSlots(int offset, int limit, String search);
    public boolean updateSlots(Slots s);
    public boolean deleteSlots(int id);
    public boolean updateSlotStatus(String slotName, String status);
	
    
}

