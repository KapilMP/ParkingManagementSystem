package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Slots;

public class SlotDAOimpl implements SlotDAO {

    private Connection conn;

    public SlotDAOimpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addSlot(Slots s) {
        boolean f = false;
        try {
            // Check if the slot with the same name already exists
            if (getSlotByName(s.getSlot_name()) != null) {
                return false; // Slot with the same name already exists, return false
            }

            String sql = "insert into parking_slots(slot_name, availability_status) values (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getSlot_name());
            ps.setString(2, s.getAvailability_status());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public Slots getSlotByName(String slotName) {
        Slots slot = null;
        try {
            String query = "SELECT * FROM parking_slots WHERE slot_name = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, slotName);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                slot = new Slots();
                slot.setId(resultSet.getInt("slotid"));
                slot.setSlot_name(resultSet.getString("slot_name"));
                slot.setAvailability_status(resultSet.getString("availability_status"));
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return slot;
    }

    @Override
    public List<Slots> getAllSlots() {
        List<Slots> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM parking_slots";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Slots s = new Slots();
                s.setId(rs.getInt("slotid"));
                s.setSlot_name(rs.getString("slot_name"));
                s.setAvailability_status(rs.getString("availability_status"));
                list.add(s);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Slots> getAllSlots(int offset, int limit) {
        List<Slots> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM parking_slots LIMIT ? OFFSET ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Slots s = new Slots();
                s.setId(rs.getInt("slotid"));
                s.setSlot_name(rs.getString("slot_name"));
                s.setAvailability_status(rs.getString("availability_status"));
                list.add(s);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int getSlotCount() {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) FROM parking_slots";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    @Override
    public List<Slots> getAllSlots(int offset, int limit, String search) {
        List<Slots> list = new ArrayList<Slots>();
        try {
            String sql = "SELECT * FROM parking_slots";
            if (search != null && !search.isEmpty()) {
                sql += " WHERE slot_name LIKE ?";
            }
            sql += " LIMIT ? OFFSET ?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            if (search != null && !search.isEmpty()) {
                ps.setString(1, "%" + search + "%");
                ps.setInt(2, limit);
                ps.setInt(3, offset);
            } else {
                ps.setInt(1, limit);
                ps.setInt(2, offset);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Slots s = new Slots();
                s.setId(rs.getInt("slotid"));
                s.setSlot_name(rs.getString("slot_name"));
                s.setAvailability_status(rs.getString("availability_status"));
                list.add(s);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public Slots getSlotById(int id) {
        Slots s = null;
        try {
            String sql = "SELECT * FROM parking_slots WHERE slotid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s = new Slots();
                s.setId(rs.getInt("slotid"));
                s.setSlot_name(rs.getString("slot_name"));
                s.setAvailability_status(rs.getString("availability_status"));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    public boolean updateSlots(Slots s) {
        boolean f = false;
        try {
            String sql = "UPDATE parking_slots SET slot_name=?, availability_status=? WHERE slotid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getSlot_name());
            ps.setString(2, s.getAvailability_status());
            ps.setInt(3, s.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deleteSlots(int id) {
        boolean f = false;
        try {
            String sql = "DELETE FROM parking_slots WHERE slotid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean updateSlotStatus(String slotName, String status) {
        boolean f = false;
        try {
            String sql = "UPDATE parking_slots SET availability_status=? WHERE slot_name=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, slotName);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }
}
