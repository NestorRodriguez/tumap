import { TestBed } from '@angular/core/testing';

import { JfService } from './jf.service';

describe('JfService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: JfService = TestBed.get(JfService);
    expect(service).toBeTruthy();
  });
});
