import * as z from "zod";

const UpdateTeacherDTO = z.object({
  name: z.string(),
  id: z.number(),
  house: z.number(),
  courses: z.number(),
});

export default UpdateTeacherDTO;
